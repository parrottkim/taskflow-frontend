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

      List<MultipartFile> files = [];

      if (value.files != null) {
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();

          final mimeType =
              lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';

          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }
      }

      // 1. 공통 필드를 포함하는 최상위 요청 생성 (Base ReportFormState에서 접근 가능)
      CreateReportRequest request = CreateReportRequest(
        scheduleId: value.schedule?.id,
        projectId: projectId,
        content: value.content ?? '',
        attachments: value.attachments ?? [],
      );

      // 3. 타입별로 분기하여 tripRequest 생성 (타입 프로모션 적용)
      if (value.schedule != null &&
          value.schedule!.category is ScheduleDomestic) {
        CreateFuelExpenseRequest? fuelRequest;

        if (value.fuel != null) {
          fuelRequest = CreateFuelExpenseRequest(
            rate: value.fuel!.rate!,
            mileage: value.fuel!.mileage!,
            distance: value.fuel!.distance!,
          );
        }

        final item = CreateTripReportRequest(
          // value.expenses, value.rates에 안전하게 접근
          expenses: value.expenses
              .map(
                (e) => CreateActualExpenseRequest(
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => CreateRegulationRateRequest(
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
        final item = CreateTripReportRequest(
          expenses: value.expenses
              .map(
                (e) => CreateActualExpenseRequest(
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => CreateRegulationRateRequest(
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

      if (files.isNotEmpty) {
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

      state = ReportSubmitState.success(report);
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

      List<MultipartFile> files = [];

      if (value.files != null) {
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();

          final mimeType =
              lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';

          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }
      }

      UpdateReportRequest request = UpdateReportRequest(
        scheduleId: value.schedule?.id,
        projectId: projectId,
        content: value.content ?? '',
        attachments: value.attachments ?? [],
      );

      // 3. 타입별로 분기하여 tripRequest 생성 (타입 프로모션 적용)
      if (value.schedule != null &&
          value.schedule!.category is ScheduleDomestic) {
        UpdateFuelExpenseRequest? fuelRequest;

        // value.fuel에 안전하게 접근
        if (value.fuel != null) {
          fuelRequest = UpdateFuelExpenseRequest(
            id: value.fuel!.id,
            rate: value.fuel!.rate,
            mileage: value.fuel!.mileage,
            distance: value.fuel!.distance,
          );
        }

        final item = UpdateTripReportRequest(
          // value.expenses, value.rates에 안전하게 접근
          expenses: value.expenses
              .map(
                (e) => UpdateActualExpenseRequest(
                  id: e.id,
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => UpdateRegulationRateRequest(
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
        final item = UpdateTripReportRequest(
          expenses: value.expenses
              .map(
                (e) => UpdateActualExpenseRequest(
                  id: e.id,
                  stepId: e.stepId,
                  price: e.price!,
                  details: e.details,
                ),
              )
              .toList(),
          rates: value.rates
              .map(
                (e) => UpdateRegulationRateRequest(
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

      if (files.isNotEmpty) {
        final newAttachments = await ref
            .read(reportRepositoryProvider)
            .uploadAttachments(reportId: report.id, files: files);

        report = report.copyWith(
          attachments: [...report.attachments, ...newAttachments],
        );
      }

      ref
          .read(reportListControllerProvider(projectId: projectId).notifier)
          .updateListItem(report);

      state = ReportSubmitState.success(report);
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

    final request = SendReportMailRequest(
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
