part of '../controller.dart';

@riverpod
class TripOptionsController extends _$TripOptionsController {
  @override
  FutureOr<TripOptionsState> build({int? categoryId}) async {
    final categories = await ref
        .read(reportRepositoryProvider)
        .getAllTripCategories();
    final steps = categoryId != null
        ? await ref
              .read(reportRepositoryProvider)
              .getAllTripSteps(id: categoryId)
        : <TripStep>[];
    final regulations = categoryId != null
        ? await ref
              .read(reportRepositoryProvider)
              .getAllTripRegulations(id: categoryId)
        : <TripRegulation>[];

    return TripOptionsState(
      categories: categories,
      steps: steps,
      regulations: regulations,
    );
  }
}
