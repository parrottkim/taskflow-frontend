part of '../data.dart';

abstract class TripRepository {
  Future<List<TripCategory>> getAllCategories();

  Future<List<TripStep>> getAllSteps({required int id});

  Future<List<TripRegulation>> getAllTripRegulations({required int id});

  Future<Trip> getTrip({required int id});

  Future<Result<Trip>> getTrips({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<Trip> createTrip({required CreateTripRequest request});

  Future<Trip> updateTrip(
      {required int id, required UpdateTripRequest request});

  Future<void> deleteTrip({required int id});
}
