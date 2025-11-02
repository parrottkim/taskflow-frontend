part of '../data.dart';

@RestApi()
abstract class TripService {
  factory TripService(Dio dio, {String baseUrl}) = _TripService;

  @GET('trip/categories')
  Future<List<TripCategory>> getAllCategories();

  @GET('trip/steps/{id}')
  Future<List<TripStep>> getAllSteps({
    @Path() required int id,
  });

  @GET('trip/regulations/{id}')
  Future<List<TripRegulation>> getAllTripRegulations({
    @Path() required int id,
  });

  @GET('trip/{id}')
  Future<Trip> getTrip({@Path() required int id});

  @GET('trip')
  Future<Result<Trip>> getTrips({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @POST('trip')
  Future<Trip> createTrip({
    @Body() required CreateTripRequest request,
  });

  @PATCH('trip/{id}')
  Future<Trip> updateTrip({
    @Path() required int id,
    @Body() required UpdateTripRequest request,
  });

  @DELETE('trip/{id}')
  Future<void> deleteTrip({
    @Path() required int id,
  });
}
