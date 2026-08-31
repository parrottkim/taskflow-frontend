part of '../data.dart';

class ReportDataSource implements ReportRepository {
  final ReportService _service;

  ReportDataSource({required ReportService service}) : _service = service;

  @override
  Future<List<TripCategory>> getAllTripCategories() =>
      _service.getAllTripCategories();

  @override
  Future<List<TripStep>> getAllTripSteps({required int id}) =>
      _service.getAllTripSteps(id: id);

  @override
  Future<List<TripRegulation>> getAllTripRegulations({required int id}) =>
      _service.getAllTripRegulations(id: id);

  @override
  Future<DailyAllowancePreview> previewDailyAllowance({
    required int scheduleId,
    List<ScheduleHoliday>? holidays,
    List<TripActualExpense>? expenses,
  }) => _service.previewDailyAllowance(
    request: {
      'scheduleId': scheduleId,
      if (holidays != null)
        'holidays': holidays
            .map(
              (holiday) => UpdateScheduleHolidayRequest(
                date: holiday.date,
                isTravelOnly: holiday.isTravelOnly,
                compensatoryLeaveDate: holiday.compensatoryLeaveDate,
              ).toJson(),
            )
            .toList(),
      if (expenses != null)
        'expenses': expenses
            .map(
              (expense) => {
                'stepId': expense.stepId,
                'price':
                    double.tryParse(
                      (expense.price ?? '').replaceAll(',', ''),
                    ) ??
                    0,
              },
            )
            .toList(),
    },
  );

  @override
  Future<HttpResponse<List<int>>> exportTrip({required int id}) =>
      _service.exportTrip(id: id);

  @override
  Future<Report> getReportForEdit({required int id}) =>
      _service.getReportForEdit(id: id);

  @override
  Future<Report> getReport({required int id}) => _service.getReport(id: id);

  @override
  Future<Result<Report>> getReports({
    int page = 1,
    int limit = 10,
    required int projectId,
  }) => _service.getReports(page: page, limit: limit, projectId: projectId);

  @override
  Future<void> sendMail({required int id, required SendMailRequest request}) =>
      _service.sendMail(id: id, request: request);

  @override
  Future<Report> createReport({required CreateReportRequest request}) =>
      _service.createReport(request: request);

  @override
  Future<Report> updateReport({
    required int id,
    required UpdateReportRequest request,
  }) => _service.updateReport(id: id, request: request);

  @override
  Future<void> deleteReport({required int id}) => _service.deleteReport(id: id);

  @override
  Future<List<ReportAttachment>> uploadAttachments({
    required int reportId,
    required List<MultipartFile> files,
  }) => _service.uploadAttachments(reportId: reportId, files: files);

  @override
  Future<void> deleteAttachment({required int reportId, required int fileId}) =>
      _service.deleteAttachment(reportId: reportId, fileId: fileId);
}

@riverpod
ReportRepository reportRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ReportDataSource(service: ReportService(dio));
}
