part of '../controller.dart';

@riverpod
class ReportSubmitController extends _$ReportSubmitController {
  @override
  ReportSubmitState build() => ReportSubmitState.idle();

  Future<void> createReport({required int projectId, int? scheduleId}) async {
    final value = ref
        .read(
          reportFormControllerProvider(
            projectId: projectId,
            scheduleId: scheduleId,
          ),
        )
        .value;

    if (value == null) return;
    if (value.content!.isEmpty) return;

    state = const ReportSubmitState.pending();

    try {
      late Report report;

      // 1. 공통 필드를 포함하는 최상위 요청 생성 (Base ReportFormState에서 접근 가능)
      CreateReportDto request = CreateReportDto(
        scheduleId: value.schedule?.id,
        projectId: projectId,
        content: value.content ?? '',
        attachments: value.attachments ?? [],
      );

      // 3. 타입별로 분기하여 tripRequest 생성 (타입 프로모션 적용)
      if (value.schedule != null &&
          value.schedule!.category is ScheduleDomestic) {
        CreateFuelExpenseDto? fuelRequest;

        if (value.fuel != null) {
          fuelRequest = CreateFuelExpenseDto(
            rate: value.fuel!.rate!,
            mileage: value.fuel!.mileage!,
            distance: value.fuel!.distance!,
          );
        }

        final item = CreateTripReportDto(
          // value.expenses, value.rates에 안전하게 접근
          expenses: value.expenses
              .map(
                (e) => CreateActualExpenseDto(
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => CreateRegulationRateDto(
                  stepId: e.stepId,
                  days: e.days!,
                  rate: e.rate!,
                  details: e.details,
                ),
              )
              .toList(),
          fuel: fuelRequest,
          isDeducted: false,
        );

        request = request.copyWith(trip: item);
      } else if (value.schedule != null &&
          value.schedule!.category is ScheduleOverseas) {
        final item = CreateTripReportDto(
          expenses: value.expenses
              .map(
                (e) => CreateActualExpenseDto(
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => CreateRegulationRateDto(
                  stepId: e.stepId,
                  days: e.days!,
                  rate: e.rate!,
                  details: e.details,
                ),
              )
              .toList(),
          fuel: null,
          isDeducted: value.isDeducted,
        );

        request = request.copyWith(trip: item);
      }

      report = await ref
          .read(reportRepositoryProvider)
          .createReport(request: request);

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';
          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }

        final newAttachments = await ref
            .read(reportRepositoryProvider)
            .uploadAttachments(reportId: report.id, files: files);

        report = report.copyWith(
          attachments: [...report.attachments, ...newAttachments],
        );
      }

      ref
          .read(reportListControllerProvider(projectId: projectId).notifier)
          .addListItem(item: report);

      state = ReportSubmitState.created(report);
    } catch (e) {
      state = ReportSubmitState.failure(e.toString());
    }
  }

  Future<void> updateReport({
    required int projectId,
    required int reportId,
    int? scheduleId,
  }) async {
    final value = ref
        .read(
          reportFormControllerProvider(
            projectId: projectId,
            reportId: reportId,
            scheduleId: scheduleId,
          ),
        )
        .value;

    if (value == null) return;
    if (value.content!.isEmpty) return;

    state = const ReportSubmitState.pending();

    try {
      late Report report;

      UpdateReportDto request = UpdateReportDto(
        scheduleId: value.schedule?.id,
        projectId: projectId,
        content: value.content ?? '',
        attachments: value.attachments ?? [],
      );

      // 3. 타입별로 분기하여 tripRequest 생성 (타입 프로모션 적용)
      if (value.schedule != null &&
          value.schedule!.category is ScheduleDomestic) {
        UpdateFuelExpenseDto? fuelRequest;

        // value.fuel에 안전하게 접근
        if (value.fuel != null) {
          fuelRequest = UpdateFuelExpenseDto(
            id: value.fuel!.id,
            rate: value.fuel!.rate,
            mileage: value.fuel!.mileage,
            distance: value.fuel!.distance,
          );
        }

        final item = UpdateTripReportDto(
          // value.expenses, value.rates에 안전하게 접근
          expenses: value.expenses
              .map(
                (e) => UpdateActualExpenseDto(
                  id: e.id,
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => UpdateRegulationRateDto(
                  id: e.id,
                  stepId: e.stepId,
                  days: e.days!,
                  rate: e.rate!,
                  details: e.details,
                ),
              )
              .toList(),
          fuel: fuelRequest,
          isDeducted: false,
        );

        request = request.copyWith(trip: item);
      } else if (value.schedule != null &&
          value.schedule!.category is ScheduleOverseas) {
        final item = UpdateTripReportDto(
          expenses: value.expenses
              .map(
                (e) => UpdateActualExpenseDto(
                  id: e.id,
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => UpdateRegulationRateDto(
                  id: e.id,
                  stepId: e.stepId,
                  days: e.days!,
                  rate: e.rate!,
                  details: e.details,
                ),
              )
              .toList(),
          fuel: null,
          isDeducted: value.isDeducted,
        );

        request = request.copyWith(trip: item);
      }

      report = await ref
          .read(reportRepositoryProvider)
          .updateReport(id: reportId, request: request);

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';
          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }

        final newAttachments = await ref
            .read(reportRepositoryProvider)
            .uploadAttachments(reportId: report.id, files: files);

        report = report.copyWith(
          attachments: [...report.attachments, ...newAttachments],
        );
      }

      ref
          .read(reportListControllerProvider(projectId: projectId).notifier)
          .updateListItem(item: report);

      state = ReportSubmitState.updated(report);
    } catch (e) {
      state = ReportSubmitState.failure(e.toString());
    }
  }

  // (deleteReport 메서드는 수정 없이 유지)
  Future<void> deleteReport({
    required int projectId,
    required int reportId,
    int? scheduleId,
  }) async {
    state = const ReportSubmitState.pending();

    try {
      await ref.read(reportRepositoryProvider).deleteReport(id: reportId);
      ref
          .read(reportListControllerProvider(projectId: projectId).notifier)
          .removeListItem(id: reportId);

      state = ReportSubmitState.deleted();
    } catch (e) {
      state = ReportSubmitState.failure(e.toString());
    }
  }

  Future<void> sendEmail({
    required int reportId,
    required List<User> users,
    required bool isAllSelected,
  }) async {
    state = const ReportSubmitState.pending();

    final request = SendMailDto(
      userIds: isAllSelected
          ? null
          : users.map((element) => element.id).toList(),
    );

    try {
      await ref
          .read(reportRepositoryProvider)
          .sendMail(id: reportId, request: request);

      state = ReportSubmitState.mailed();
    } catch (e) {
      state = ReportSubmitState.failure(e.toString());
    }
  }
}
