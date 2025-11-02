import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/accommodation_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/daily_expense_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/local_transportation_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/other_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/progress_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/schedule_selector_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/transportation_widget.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class TripFormScreen extends HookConsumerWidget {
  final int projectId;
  final int? tripId;

  const TripFormScreen({
    super.key,
    required this.projectId,
    this.tripId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
        tripFormControllerProvider(projectId: projectId, tripId: tripId));
    final filter = ref.watch(tripFilterControllerProvider(categoryId: null));

    final step = ref.watch(tripStepControllerProvider);

    final pageController = usePageController(initialPage: step.currentIndex);

    return BranchLayout(
      onTap: () {
        if (step.currentIndex > 0) {
          pageController.animateToPage(
            step.currentIndex - 1,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutQuad,
          );
          return;
        }

        context.pop();
      },
      child: switch ((form, filter)) {
        (AsyncData(value: final form), AsyncData(value: final filter)) =>
          _DesktopWidget(
            projectId: projectId,
            tripId: tripId,
            pageController: pageController,
            currentIndex: step.currentIndex,
            categories: filter.categories,
            schedule: form.schedule,
            expenses: form.expenses,
            rates: form.rates,
            fuel: form is TripFormDomestic ? form.fuel : null,
            isDeducted: form is TripFormOverseas ? form.isDeducted : false,
          ),
        ((AsyncError(:final error, :final stackTrace), _) ||
              (_, AsyncError(:final error, :final stackTrace))) =>
          ErrorContainerWidget(error: error, stackTrace: stackTrace),
        _ => Skeletonizer(
            ignoreContainers: true,
            child: _DesktopWidget(
              projectId: projectId,
              tripId: tripId,
              pageController: pageController,
              currentIndex: step.currentIndex,
              categories: List.filled(6, TripCategory.dummy()),
              expenses: [],
              rates: [],
            ),
          ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? tripId;
  final PageController pageController;
  final int currentIndex;
  final Schedule? schedule;
  final List<TripCategory> categories;
  final List<TripActualExpense> expenses;
  final List<TripRegulationRate> rates;
  final TripFuelExpense? fuel;
  final bool isDeducted;

  const _DesktopWidget({
    required this.projectId,
    this.tripId,
    required this.pageController,
    required this.currentIndex,
    this.schedule,
    required this.categories,
    required this.expenses,
    required this.rates,
    this.fuel,
    this.isDeducted = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final isScheduleInvalid = useState(false);

    final isTransportationInvalid = useState<Map<int, bool>>({});
    final isLocalTransportationInvalid = useState<Map<int, bool>>({});
    final isAccommodationInvalid = useState<Map<int, bool>>({});
    final isDailyExpenseInvalid = useState<Map<int, bool>>({});
    final isOtherInvalid = useState<Map<int, bool>>({});
    final isFuelInvalid = useState<bool>(false);

    useEffect(() {
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutQuad,
        );
      }
      return null;
    }, [currentIndex]);

    ref.listen(tripSubmitControllerProvider, (_, state) {
      if (state is TripSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is TripSubmitSuccess) {
          context.goNamed(RouteNames.projectDetail, pathParameters: {
            'project_id': projectId.toString()
          }, queryParameters: {
            'view': 'trip',
            'trip': state.trip.id.toString(),
          });
        }
        if (state is ProjectSubmitDeleted) {
          context.goNamed(RouteNames.project);
        }
      }
    });

    bool isInvalid() {
      isScheduleInvalid.value = schedule == null;

      isTransportationInvalid.value = {
        for (var entry in isTransportationInvalid.value.entries)
          entry.key: expenses
              .where((item) => item.stepId == entry.key)
              .any((item) => item.price == null || item.price!.isEmpty)
      };

      final isAllTransportationInvalid =
          isTransportationInvalid.value.values.any((v) => v);

      isLocalTransportationInvalid.value = {
        for (var entry in isLocalTransportationInvalid.value.entries)
          entry.key: expenses
              .where((item) => item.stepId == entry.key)
              .any((item) => item.price == null || item.price!.isEmpty)
      };

      final isAllLocalTransportationInvalid =
          isLocalTransportationInvalid.value.values.any((v) => v);

      isAccommodationInvalid.value = {
        for (var entry in isAccommodationInvalid.value.entries)
          entry.key: expenses
                  .where((item) => item.stepId == entry.key)
                  .any((item) => item.price == null || item.price!.isEmpty) ||
              expenses.where((item) => item.stepId == entry.key).isNotEmpty &&
                  rates.isEmpty ||
              expenses.where((item) => item.stepId == entry.key).isNotEmpty &&
                  rates.where((setting) => setting.stepId == entry.key).any(
                      (setting) =>
                          setting.days == null || setting.days!.isEmpty) ||
              rates
                      .where((setting) => setting.stepId == entry.key)
                      .isNotEmpty &&
                  (expenses.where((item) => item.stepId == entry.key).isEmpty ||
                      expenses.where((item) => item.stepId == entry.key).any(
                          (item) => item.price == null || item.price!.isEmpty))
      };

      final isAllAccommodationInvalid =
          isAccommodationInvalid.value.values.any((v) => v);

      isDailyExpenseInvalid.value = {
        for (var entry in isDailyExpenseInvalid.value.entries)
          entry.key: rates
              .where((item) => item.stepId == entry.key)
              .any((item) => item.days == null || item.days!.isEmpty)
      };

      final isAllDailyExpenseInvalid =
          isDailyExpenseInvalid.value.values.any((v) => v);

      isOtherInvalid.value = {
        for (var entry in isOtherInvalid.value.entries)
          entry.key: expenses
              .where((item) => item.stepId == entry.key)
              .any((item) => item.price == null || item.price!.isEmpty)
      };

      final isAllOtherInvalid = isOtherInvalid.value.values.any((v) => v);

      isFuelInvalid.value = schedule != null &&
          schedule!.category is ScheduleDomestic &&
          fuel != null &&
          (fuel?.rate == null ||
              fuel!.rate!.isEmpty ||
              fuel?.mileage == null ||
              fuel!.mileage!.isEmpty ||
              fuel?.distance == null ||
              fuel!.distance!.isEmpty);

      return isScheduleInvalid.value ||
          isAllTransportationInvalid ||
          isAllLocalTransportationInvalid ||
          isAllAccommodationInvalid ||
          isAllDailyExpenseInvalid ||
          isAllOtherInvalid ||
          isFuelInvalid.value;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressWidget(
                currentIndex: currentIndex,
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    if (value < currentIndex && isInvalid()) {
                      pageController.animateToPage(
                        currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOutQuad,
                      );
                      return;
                    }

                    ref
                        .read(tripStepControllerProvider.notifier)
                        .setIndex(index: value);
                  },
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ScheduleSelectorWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: schedule,
                      isScheduleInvalid: isScheduleInvalid,
                    ),
                    TransportationWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: schedule,
                      expenses: expenses,
                      isTransportationInvalid: isTransportationInvalid,
                    ),
                    LocalTransportationWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: schedule,
                      expenses: expenses,
                      isLocalTransportationInvalid:
                          isLocalTransportationInvalid,
                    ),
                    AccommodationWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: schedule,
                      expenses: expenses,
                      rates: rates,
                      isAccommodationInvalid: isAccommodationInvalid,
                    ),
                    DailyExpenseWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: schedule,
                      rates: rates,
                      isDeducted: isDeducted,
                      isDailyExpenseInvalid: isDailyExpenseInvalid,
                    ),
                    OtherWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: schedule,
                      expenses: expenses,
                      fuel: fuel,
                      isOtherInvalid: isOtherInvalid,
                      isFuelInvalid: isFuelInvalid,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:
              EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
          constraints: BoxConstraints(maxWidth: 430.0),
          child: Row(
            children: [
              if (currentIndex < categories.length)
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (isInvalid()) return;

                      ref
                          .read(tripStepControllerProvider.notifier)
                          .setIndex(index: currentIndex + 1);
                    },
                    child: Text(Intl.message('common_next')),
                  ),
                )
              else
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (isInvalid()) return;

                      if (tripId == null) {
                        ref
                            .read(tripSubmitControllerProvider.notifier)
                            .createTrip(projectId: projectId);
                      } else {
                        ref
                            .read(tripSubmitControllerProvider.notifier)
                            .updateTrip(projectId: projectId, tripId: tripId!);
                      }
                    },
                    child: Text(
                      tripId != null
                          ? Intl.message('common_edit')
                          : Intl.message('common_post'),
                    ),
                  ),
                ),
              if (tripId != null)
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      iconColor: colorScheme.onError,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(
                        Symbols.delete_rounded,
                        size: 19.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
