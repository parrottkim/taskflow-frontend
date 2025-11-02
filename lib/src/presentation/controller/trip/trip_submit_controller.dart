part of '../controller.dart';

@riverpod
class TripSubmitController extends _$TripSubmitController {
  @override
  TripSubmitState build() => TripSubmitState.idle();

  Future<void> createTrip({required int projectId}) async {
    final value =
        ref.read(tripFormControllerProvider(projectId: projectId)).valueOrNull;

    if (value == null) return;

    state = const TripSubmitState.pending();

    try {
      CreateTripRequest request = CreateTripRequest(
        scheduleId: value.schedule!.id,
        expenses: value.expenses
            .map((e) => CreateActualExpenseRequest(
                stepId: e.stepId, price: e.price!, details: e.details))
            .toList(),
        rates: value.rates
            .map((e) => CreateRegulationRateRequest(
                stepId: e.stepId,
                days: e.days!,
                rate: e.rate!,
                details: e.details))
            .toList(),
      );

      if (value is TripFormDomestic) {
        request = request.copyWith(
          fuel: value.fuel,
          isDeducted: false,
        );
      }

      if (value is TripFormOverseas) {
        request = request.copyWith(
          isDeducted: value.isDeducted,
        );
      }

      final trip =
          await ref.read(tripRepositoryProvider).createTrip(request: request);

      state = TripSubmitState.success(trip);
    } catch (e) {
      state = TripSubmitState.failure(e.toString());
    }
  }

  Future<void> updateTrip({required int projectId, required int tripId}) async {
    final value = ref
        .read(tripFormControllerProvider(projectId: projectId, tripId: tripId))
        .valueOrNull;

    if (value == null) return;

    state = const TripSubmitState.pending();

    try {
      UpdateTripRequest request = UpdateTripRequest(
        scheduleId: value.schedule!.id,
        expenses: value.expenses
            .map((e) => UpdateActualExpenseRequest(
                id: e.id,
                stepId: e.stepId,
                price: e.price!,
                details: e.details))
            .toList(),
        rates: value.rates
            .map((e) => UpdateRegulationRateRequest(
                id: e.id,
                stepId: e.stepId,
                days: e.days!,
                rate: e.rate!,
                details: e.details))
            .toList(),
      );

      if (value is TripFormDomestic) {
        request = request.copyWith(
          fuel: value.fuel,
          isDeducted: false,
        );
      }

      if (value is TripFormOverseas) {
        request = request.copyWith(
          isDeducted: value.isDeducted,
        );
      }

      final trip = await ref
          .read(tripRepositoryProvider)
          .updateTrip(id: tripId, request: request);

      ref
          .read(tripListControllerProvider(projectId: projectId).notifier)
          .updateListItem(trip);

      state = TripSubmitState.success(trip);
    } catch (e) {
      state = TripSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteTrip({required int projectId, required int tripId}) async {
    state = const TripSubmitState.pending();

    try {
      await ref.read(tripRepositoryProvider).deleteTrip(id: tripId);
      ref
          .read(tripListControllerProvider(projectId: projectId).notifier)
          .removeListItem(id: tripId);

      state = TripSubmitState.deleted();
    } catch (e) {
      state = TripSubmitState.failure(e.toString());
    }
  }
}
