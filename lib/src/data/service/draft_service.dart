part of '../data.dart';

@RestApi()
abstract class DraftService {
  factory DraftService(Dio dio, {String baseUrl}) = _DraftService;

  @GET('drafts/{id}')
  Future<Draft?> getDraft({@Path() required String id});

  @PUT('drafts/{id}')
  Future<Draft> saveDraft({@Path() required String id});

  @DELETE('drafts/{id}')
  Future<void> deleteDraft({@Path() required String id});
}
