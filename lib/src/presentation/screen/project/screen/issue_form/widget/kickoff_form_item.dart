import 'package:flutter/material.dart' hide DatePickerDialog;
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class KickoffFormItem extends ConsumerWidget {
  final DateTime? kickoffDate;
  final List<KickoffIssueParticipantItem> participantItems;
  final List<KickoffIssueTripItem> tripItems;

  const KickoffFormItem({
    super.key,
    this.kickoffDate,
    required this.participantItems,
    required this.tripItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(issueOptionsProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        kickoffDate: kickoffDate,
        participantItems: participantItems,
        categories: value.tripCategories,
        tripItems: tripItems,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorStateView(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          participantItems: [],
          categories: [],
          tripItems: [],
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final DateTime? kickoffDate;
  final List<KickoffIssueParticipantItem> participantItems;
  final List<KickoffIssueTripItemCategory> categories;
  final List<KickoffIssueTripItem> tripItems;

  const _DesktopWidget({
    this.kickoffDate,
    required this.participantItems,
    required this.categories,
    required this.tripItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scope = IssueFormScope.of(context);
    final projectId = scope.projectId;
    final categoryId = scope.categoryId;
    final issueId = scope.issueId;
    final validation = ref.watch(issueValidationControllerProvider);
    final validationController = ref.read(
      issueValidationControllerProvider.notifier,
    );
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final participantRoleControllers = useMemoized(
      () => participantItems
          .map((element) => TextEditingController(text: element.role))
          .toList(),
      [participantItems.length],
    );
    final tripDaysControllers = useMemoized(
      () => tripItems
          .map(
            (element) => TextEditingController(
              text: element.days > 0 ? element.days.toString() : '',
            ),
          )
          .toList(),
      [tripItems.length],
    );
    final tripNoteControllers = useMemoized(
      () => tripItems
          .map((element) => TextEditingController(text: element.note))
          .toList(),
      [tripItems.length],
    );
    final participantRoleFocuses = useMemoized(
      () => participantItems.map((_) => FocusNode()).toList(),
      [participantItems.length],
    );
    final tripDaysFocuses = useMemoized(
      () => tripItems.map((_) => FocusNode()).toList(),
      [tripItems.length],
    );
    final tripNoteFocuses = useMemoized(
      () => tripItems.map((_) => FocusNode()).toList(),
      [tripItems.length],
    );

    final total = useMemoized(
      () =>
          tripItems.map((e) => e.days).fold<int>(0, (sum, days) => sum + days),
      [tripItems],
    );

    final participantOpacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final participantSizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (participantItems.isNotEmpty) {
        participantSizeController.forward().then(
          (_) => participantOpacityController.forward(),
        );
      } else {
        participantOpacityController.reverse().then(
          (_) => participantSizeController.reverse(),
        );
      }
      return null;
    }, [participantItems]);

    final tripOpacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final tripSizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (tripItems.isNotEmpty) {
        tripSizeController.forward().then(
          (_) => tripOpacityController.forward(),
        );
      } else {
        tripOpacityController.reverse().then(
          (_) => tripSizeController.reverse(),
        );
      }
      return null;
    }, [tripItems]);

    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
      constraints: BoxConstraints(maxWidth: 600.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('issue_form_kickoff_1'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          Skeleton.unite(
            child: ElevatedButton.icon(
              onPressed: () async {
                validationController.clearKickoffDate();

                final result = await showDialog(
                  context: context,
                  builder: (_) => DatePickerDialog(
                    initialDate: kickoffDate,
                    title: Intl.message('issue_form_kickoff_2'),
                  ),
                );

                if (result != null) {
                  ref
                      .read(
                        issueFormControllerProvider(
                          projectId: projectId,
                          categoryId: categoryId,
                          issueId: issueId,
                        ).notifier,
                      )
                      .setKickoffDate(date: result);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 12.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
              ),
              icon: Icon(Symbols.event_rounded),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    kickoffDate == null
                        ? Intl.message('issue_form_kickoff_2')
                        : DateFormat.yMMMd(
                            Intl.getCurrentLocale(),
                          ).format(kickoffDate!),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Symbols.chevron_right_rounded),
                ],
              ),
            ),
          ),
          ValidationErrorMessage(
            visible: validation.kickoffDateMissing,
            text: Intl.message('issue_form_kickoff_invalid'),
          ),
          SizedBox(height: 24.0),
          Text(
            Intl.message('issue_form_kickoff_3'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          TextButton.icon(
            onPressed: () {
              validationController.clearKickoffParticipants();

              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .addKickoffIssueParticipantItems();
            },
            icon: Icon(Symbols.add_rounded),
            label: Text(Intl.message('issue_form_transaction_2')),
          ),
          if (participantItems.isNotEmpty)
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: participantSizeController,
                curve: Curves.easeInQuad,
              ),
              child: FadeTransition(
                opacity: participantOpacityController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: DataTable(
                    headingRowHeight: 36.0,
                    showCheckboxColumn: false,
                    horizontalMargin: 0.0,
                    dataRowMinHeight: 34.0,
                    dataRowMaxHeight: 34.0,
                    showBottomBorder: true,
                    border: TableBorder(
                      verticalInside: BorderSide(
                        color: colorScheme.outline.subtle,
                        width: 1.0,
                      ),
                      horizontalInside: BorderSide(
                        color: colorScheme.outline.subtle,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: colorScheme.outline.subtle,
                        width: 1.0,
                      ),
                    ),
                    columns: [
                      DataColumn(
                        columnWidth: FixedColumnWidth(160.0),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.person_rounded,
                                color: colorScheme.onSurface.strong,
                                size: 16.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                Intl.message('issue_form_kickoff_5'),
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface.strong,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        columnWidth: FlexColumnWidth(0.6),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.numbers_rounded,
                                color: colorScheme.onSurface.strong,
                                size: 16.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                Intl.message('issue_form_kickoff_6'),
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface.strong,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    rows: List.generate(participantItems.length, (index) {
                      useListenable(participantRoleFocuses[index]);
                      final participant = participantItems[index].participant;

                      return DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (_) => UserSelectorDialog(
                                      onSingleSelected: (user) {
                                        validationController
                                            .clearKickoffParticipants();
                                        ref
                                            .read(
                                              issueFormControllerProvider(
                                                projectId: projectId,
                                                categoryId: categoryId,
                                                issueId: issueId,
                                              ).notifier,
                                            )
                                            .updateKickoffIssueParticipantItems(
                                              index: index,
                                              user: user,
                                            );
                                      },
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 12.0,
                                    top: 16.0,
                                    bottom: 16.0,
                                  ),
                                ),
                                icon: participant == null
                                    ? const Icon(Symbols.person_search_rounded)
                                    : CircleAvatar(
                                        backgroundColor: Functions(
                                          context,
                                        ).generateColorFromId(participant.id),
                                        radius: 10.0,
                                        child: Text(
                                          getInitials(participant.username),
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        participant?.username ??
                                            Intl.message(
                                              'issue_form_kickoff_7',
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    if (participant == null)
                                      const Icon(Symbols.chevron_right_rounded)
                                    else
                                      InkWell(
                                        onTap: () {
                                          validationController
                                              .clearKickoffParticipants();
                                          ref
                                              .read(
                                                issueFormControllerProvider(
                                                  projectId: projectId,
                                                  categoryId: categoryId,
                                                  issueId: issueId,
                                                ).notifier,
                                              )
                                              .clearKickoffIssueParticipantUser(
                                                index: index,
                                              );
                                        },
                                        borderRadius: BorderRadius.circular(
                                          4.0,
                                        ),
                                        child: const Icon(
                                          Symbols.close_rounded,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                Expanded(
                                  child: Material(
                                    elevation:
                                        participantRoleFocuses[index].hasFocus
                                        ? 1.0
                                        : 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    color:
                                        participantRoleFocuses[index].hasFocus
                                        ? colorScheme.surfaceBright
                                        : colorScheme.surfaceContainerLow,
                                    child: TextField(
                                      controller:
                                          participantRoleControllers[index],
                                      focusNode: participantRoleFocuses[index],
                                      style: textTheme.bodyMedium,
                                      maxLines: 1,
                                      onChanged: (value) {
                                        validationController
                                            .clearKickoffParticipants();

                                        ref
                                            .read(
                                              issueFormControllerProvider(
                                                projectId: projectId,
                                                categoryId: categoryId,
                                                issueId: issueId,
                                              ).notifier,
                                            )
                                            .updateKickoffIssueParticipantItems(
                                              index: index,
                                              role: value,
                                            );
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                          borderSide: BorderSide(
                                            width: 2.0,
                                            color: colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ElevatedIconButton(
                                    onTap: () {
                                      validationController
                                          .clearKickoffParticipants();
                                      ref
                                          .read(
                                            issueFormControllerProvider(
                                              projectId: projectId,
                                              categoryId: categoryId,
                                              issueId: issueId,
                                            ).notifier,
                                          )
                                          .removeKickoffIssueParticipantItems(
                                            index: index,
                                          );
                                    },
                                    padding: EdgeInsets.all(4.0),
                                    borderRadius: BorderRadius.circular(4.0),
                                    icon: Symbols.delete_rounded,
                                    size: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ValidationErrorMessage(
            visible: validation.kickoffParticipantItemsMissing,
            text: Intl.message('issue_form_kickoff_participant_missing'),
          ),
          ValidationErrorMessage(
            visible: validation.kickoffParticipantItemInvalid,
            text: Intl.message('issue_form_kickoff_participant_invalid'),
          ),
          SizedBox(height: 24.0),
          Text(
            Intl.message('issue_form_kickoff_8'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          TextButton.icon(
            onPressed: () {
              validationController.clearKickoffTrips();

              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .addKickoffIssueTripItems();
            },
            icon: Icon(Symbols.add_rounded),
            label: Text(Intl.message('issue_form_transaction_2')),
          ),
          if (tripItems.isNotEmpty)
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: tripSizeController,
                curve: Curves.easeInQuad,
              ),
              child: FadeTransition(
                opacity: tripOpacityController,
                child: Column(
                  children: [
                    DataTable(
                      headingRowHeight: 36.0,
                      showCheckboxColumn: false,
                      horizontalMargin: 0.0,
                      dataRowMinHeight: 34.0,
                      dataRowMaxHeight: 34.0,
                      showBottomBorder: true,
                      border: TableBorder(
                        verticalInside: BorderSide(
                          color: colorScheme.outline.subtle,
                          width: 1.0,
                        ),
                        horizontalInside: BorderSide(
                          color: colorScheme.outline.subtle,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: colorScheme.outline.subtle,
                          width: 1.0,
                        ),
                      ),
                      columns: [
                        DataColumn(
                          columnWidth: const FixedColumnWidth(160.0),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Symbols.category_rounded,
                                  color: colorScheme.onSurface.strong,
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  Intl.message('issue_form_kickoff_9'),
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FixedColumnWidth(100.0),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Symbols.numbers_rounded,
                                  color: colorScheme.onSurface.strong,
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  Intl.message('issue_form_kickoff_10'),
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FlexColumnWidth(),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Symbols.text_fields_rounded,
                                  color: colorScheme.onSurface.strong,
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  Intl.message('issue_form_kickoff_11'),
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      rows: List.generate(tripItems.length, (index) {
                        useListenable(tripDaysFocuses[index]);
                        useListenable(tripNoteFocuses[index]);

                        return DataRow(
                          cells: [
                            DataCell(
                              SizedBox(
                                width: double.infinity,
                                child:
                                    ElevatedDropdownButton<
                                      KickoffIssueTripItemCategory
                                    >(
                                      isExpanded: true,
                                      items: categories,
                                      value: tripItems[index].category,
                                      icon: const Icon(
                                        Symbols.category_rounded,
                                      ),
                                      label: Text(
                                        Intl.message('issue_form_kickoff_12'),
                                      ),
                                      itemBuilder: (category) => Text(
                                        category.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onChanged: (value) {
                                        validationController
                                            .clearKickoffTrips();
                                        ref
                                            .read(
                                              issueFormControllerProvider(
                                                projectId: projectId,
                                                categoryId: categoryId,
                                                issueId: issueId,
                                              ).notifier,
                                            )
                                            .updateKickoffIssueTripItems(
                                              index: index,
                                              category: value,
                                            );
                                      },
                                      onClear: () {
                                        validationController
                                            .clearKickoffTrips();
                                        ref
                                            .read(
                                              issueFormControllerProvider(
                                                projectId: projectId,
                                                categoryId: categoryId,
                                                issueId: issueId,
                                              ).notifier,
                                            )
                                            .clearKickoffIssueTripCategory(
                                              index: index,
                                            );
                                      },
                                    ),
                              ),
                            ),
                            DataCell(
                              Material(
                                elevation: tripDaysFocuses[index].hasFocus
                                    ? 1.0
                                    : 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                                color: tripDaysFocuses[index].hasFocus
                                    ? colorScheme.surfaceBright
                                    : colorScheme.surfaceContainerLow,
                                child: TextField(
                                  controller: tripDaysControllers[index],
                                  focusNode: tripDaysFocuses[index],
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  textAlign: TextAlign.end,
                                  style: textTheme.bodyMedium,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    counterText: '',
                                    suffixText: Intl.message(
                                      'issue_form_kickoff_14',
                                    ),
                                  ),
                                  onChanged: (value) {
                                    validationController.clearKickoffTrips();
                                    ref
                                        .read(
                                          issueFormControllerProvider(
                                            projectId: projectId,
                                            categoryId: categoryId,
                                            issueId: issueId,
                                          ).notifier,
                                        )
                                        .updateKickoffIssueTripItems(
                                          index: index,
                                          days: int.tryParse(value) ?? 0,
                                        );
                                  },
                                ),
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Expanded(
                                    child: Material(
                                      elevation: tripNoteFocuses[index].hasFocus
                                          ? 1.0
                                          : 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: tripNoteFocuses[index].hasFocus
                                          ? colorScheme.surfaceBright
                                          : colorScheme.surfaceContainerLow,
                                      child: TextField(
                                        controller: tripNoteControllers[index],
                                        focusNode: tripNoteFocuses[index],
                                        style: textTheme.bodyMedium,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8.0,
                                            ),
                                            borderSide: BorderSide(
                                              width: 2.0,
                                              color: colorScheme.primary,
                                            ),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          validationController
                                              .clearKickoffTrips();
                                          ref
                                              .read(
                                                issueFormControllerProvider(
                                                  projectId: projectId,
                                                  categoryId: categoryId,
                                                  issueId: issueId,
                                                ).notifier,
                                              )
                                              .updateKickoffIssueTripItems(
                                                index: index,
                                                note: value,
                                              );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ElevatedIconButton(
                                      onTap: () {
                                        validationController
                                            .clearKickoffTrips();
                                        ref
                                            .read(
                                              issueFormControllerProvider(
                                                projectId: projectId,
                                                categoryId: categoryId,
                                                issueId: issueId,
                                              ).notifier,
                                            )
                                            .removeKickoffIssueTripItems(
                                              index: index,
                                            );
                                      },
                                      padding: const EdgeInsets.all(4.0),
                                      borderRadius: BorderRadius.circular(4.0),
                                      icon: Symbols.delete_rounded,
                                      size: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: colorScheme.outline.subtle,
                            width: 1.0,
                          ),
                        ),
                        color: colorScheme.surfaceContainer,
                      ),
                      child: Row(
                        children: [
                          Text(
                            Intl.message('issue_form_kickoff_13'),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Expanded(
                            child: Text(
                              '$total ${Intl.message('issue_form_kickoff_14')}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ValidationErrorMessage(
            visible: validation.kickoffTripItemsMissing,
            text: Intl.message('issue_form_kickoff_trip_missing'),
          ),
          ValidationErrorMessage(
            visible: validation.kickoffTripItemInvalid,
            text: Intl.message('issue_form_kickoff_trip_invalid'),
          ),
        ],
      ),
    );
  }
}
