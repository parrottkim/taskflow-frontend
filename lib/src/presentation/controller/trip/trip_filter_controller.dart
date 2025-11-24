part of '../controller.dart';

@riverpod
class TripFilterController extends _$TripFilterController {
  @override
  FutureOr<TripFilterState> build({int? categoryId}) async {
    return _init();
  }

  Future<TripFilterState> _init() async {
    final List<TripCategory> categories =
        await ref.read(reportRepositoryProvider).getAllTripCategories();
    final List<TripStep> steps = categoryId != null
        ? await ref
            .read(reportRepositoryProvider)
            .getAllTripSteps(id: categoryId!)
        : [];
    final List<TripRegulation> regulations = categoryId != null
        ? await ref
            .read(reportRepositoryProvider)
            .getAllTripRegulations(id: categoryId!)
        : [];

    return TripFilterState(
      categories: categories,
      steps: steps,
      regulations: regulations,
    );
  }
}
