part of '../data.dart';

abstract class ReportRepository {
  Future<List<TripCategory>> getAllTripCategories();

  Future<List<TripStep>> getAllTripSteps({required int id});

  Future<List<TripRegulation>> getAllTripRegulations({required int id});

  Future<HttpResponse<List<int>>> exportTrip({required int id});

  Future<Report> getReportForEdit({required int id});

  Future<Report> getReport({required int id});

  Future<Result<Report>> getReports({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<void> sendMail({required int id, required SendMailRequest request});

  Future<Report> createReport({required CreateReportRequest request});

  Future<Report> updateReport({
    required int id,
    required UpdateReportRequest request,
  });

  Future<void> deleteReport({required int id});

  Future<List<ReportAttachment>> uploadAttachments({
    required int reportId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({required int reportId, required int fileId});
}
