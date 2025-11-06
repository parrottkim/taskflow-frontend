part of '../controller.dart';

@riverpod
class TripFilterController extends _$TripFilterController {
  @override
  FutureOr<TripFilterState> build({int? categoryId}) async {
    return _init();
  }

  Future<TripFilterState> _init() async {
    final List<TripCategory> categories =
        await ref.read(tripRepositoryProvider).getAllCategories();
    final List<TripStep> steps = categoryId != null
        ? await ref.read(tripRepositoryProvider).getAllSteps(id: categoryId!)
        : [];
    final List<TripRegulation> regulations = categoryId != null
        ? await ref
            .read(tripRepositoryProvider)
            .getAllTripRegulations(id: categoryId!)
        : [];

    return TripFilterState(
      categories: categories,
      steps: steps,
      regulations: regulations,
    );
  }
}
