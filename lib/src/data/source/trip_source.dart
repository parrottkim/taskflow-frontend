part of '../data.dart';

class TripDataSource implements TripRepository {
  final TripService _service;

  TripDataSource({required TripService service}) : _service = service;

  @override
  Future<List<TripCategory>> getAllCategories() => _service.getAllCategories();

  @override
  Future<List<TripStep>> getAllSteps({required int id}) =>
      _service.getAllSteps(id: id);

  @override
  Future<List<TripRegulation>> getAllTripRegulations({required int id}) =>
      _service.getAllTripRegulations(id: id);

  @override
  Future<Trip> getTrip({required int id}) => _service.getTrip(id: id);

  @override
  Future<Result<Trip>> getTrips(
          {int page = 1, int limit = 10, required int projectId}) =>
      _service.getTrips(page: page, limit: limit, projectId: projectId);

  @override
  Future<Trip> createTrip({required CreateTripRequest request}) =>
      _service.createTrip(request: request);

  @override
  Future<Trip> updateTrip(
          {required int id, required UpdateTripRequest request}) =>
      _service.updateTrip(id: id, request: request);

  @override
  Future<void> deleteTrip({required int id}) => _service.deleteTrip(id: id);
}

@riverpod
TripRepository tripRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return TripDataSource(service: TripService(dio));
}
