part of '../controller.dart';

@riverpod
class ReportSubmitController extends _$ReportSubmitController {
  @override
  ReportSubmitState build() => ReportSubmitState.idle();

  Future<void> createReport({
    required int projectId,
    int? scheduleId,
    required appflowy.EditorState editorState,
  }) async {
    final value = ref
        .read(
          reportFormControllerProvider(
            projectId: projectId,
            scheduleId: scheduleId,
          ),
        )
        .requireValue;
    state = const ReportSubmitState.pending();

    try {
      late Report report;
      final initialContent = value.content ?? '';
      final dailyAllowance = value.schedule?.category is ScheduleDomestic
          ? await ref
                .read(reportRepositoryProvider)
                .previewDailyAllowance(
                  scheduleId: value.schedule!.id,
                  holidays: value.schedule!.holidays,
                )
          : null;

      // 1. 공통 필드를 포함하는 최상위 요청 생성 (Base ReportFormState에서 접근 가능)
      CreateReportRequest request = CreateReportRequest(
        scheduleId: value.schedule?.id,
        projectId: projectId,
        content: initialContent,
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
                  currencyId: e.currencyId,
                  price: e.price!,
                  paymentDate: e.paymentDate,
                  details: e.details,
                ),
              )
              .toList(),
          rates: [
            ...value.rates
                .where((rate) => rate.stepId != 10 && rate.stepId != 11)
                .map(
                  (rate) => CreateRegulationRateRequest(
                    stepId: rate.stepId,
                    days: rate.days!,
                    rate: rate.rate!,
                    details: rate.details,
                  ),
                ),
            CreateRegulationRateRequest(
              stepId: 10,
              days: dailyAllowance!.totalTripDays.toString(),
              rate:
                  dailyAllowance.dailyRate ==
                      dailyAllowance.dailyRate.truncateToDouble()
                  ? dailyAllowance.dailyRate.toInt().toString()
                  : dailyAllowance.dailyRate.toString(),
            ),
          ],
          fuel: fuelRequest,
          holidays: value.schedule!.holidays
              .map(
                (holiday) => UpdateScheduleHolidayRequest(
                  date: holiday.date,
                  isTravelOnly: holiday.isTravelOnly,
                  compensatoryLeaveDate: holiday.compensatoryLeaveDate,
                ),
              )
              .toList(),
        );

        request = request.copyWith(trip: item);
      } else if (value.schedule != null &&
          value.schedule!.category is ScheduleOverseas) {
        final item = CreateTripReportRequest(
          expenses: value.expenses
              .map(
                (e) => CreateActualExpenseRequest(
                  stepId: e.stepId,
                  currencyId: e.currencyId,
                  price: e.price!,
                  paymentDate: e.paymentDate,
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
        );

        request = request.copyWith(trip: item);
      }

      report = await ref
          .read(reportRepositoryProvider)
          .createReport(request: request);

      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: report.id,
      );
      if (content != initialContent) {
        report = await ref
            .read(reportRepositoryProvider)
            .updateReport(
              id: report.id,
              request: _buildUpdateRequest(
                value: value,
                projectId: projectId,
                content: content,
                persistedReport: report,
                dailyAllowance: dailyAllowance,
              ),
            );
      }

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
    required appflowy.EditorState editorState,
  }) async {
    final value = ref
        .read(
          reportFormControllerProvider(
            projectId: projectId,
            reportId: reportId,
            scheduleId: scheduleId,
          ),
        )
        .requireValue;
    state = const ReportSubmitState.pending();

    try {
      final dailyAllowance = value.schedule?.category is ScheduleDomestic
          ? await ref
                .read(reportRepositoryProvider)
                .previewDailyAllowance(
                  scheduleId: value.schedule!.id,
                  holidays: value.schedule!.holidays,
                )
          : null;
      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: reportId,
      );
      final request = _buildUpdateRequest(
        value: value,
        projectId: projectId,
        content: content,
        dailyAllowance: dailyAllowance,
      );

      Report report = await ref
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

  UpdateReportRequest _buildUpdateRequest({
    required ReportFormState value,
    required int projectId,
    required String content,
    Report? persistedReport,
    DailyAllowancePreview? dailyAllowance,
  }) {
    var request = UpdateReportRequest(
      scheduleId: value.schedule?.id,
      projectId: projectId,
      content: content,
      attachments: value.attachments ?? [],
    );

    if (value.schedule?.category is ScheduleDomestic) {
      final fuel = value.fuel;
      final existingDailyRate =
          persistedReport?.trip?.rates.firstWhereOrNull(
            (rate) => rate.stepId == 10,
          ) ??
          value.rates.firstWhereOrNull((rate) => rate.stepId == 10);
      final trip = UpdateTripReportRequest(
        expenses: value.expenses.indexed
            .map(
              (entry) => UpdateActualExpenseRequest(
                id: entry.$1 < (persistedReport?.trip?.expenses.length ?? 0)
                    ? persistedReport!.trip!.expenses[entry.$1].id
                    : entry.$2.id,
                stepId: entry.$2.stepId,
                currencyId: entry.$2.currencyId,
                price: entry.$2.price!,
                paymentDate: entry.$2.paymentDate,
                details: entry.$2.details,
              ),
            )
            .toList(),
        rates: [
          ...value.rates
              .where((rate) => rate.stepId != 10 && rate.stepId != 11)
              .map(
                (rate) => UpdateRegulationRateRequest(
                  id: rate.id,
                  stepId: rate.stepId,
                  days: rate.days!,
                  rate: rate.rate!,
                  details: rate.details,
                ),
              ),
          UpdateRegulationRateRequest(
            id: existingDailyRate?.id,
            stepId: 10,
            days: dailyAllowance!.totalTripDays.toString(),
            rate:
                dailyAllowance.dailyRate ==
                    dailyAllowance.dailyRate.truncateToDouble()
                ? dailyAllowance.dailyRate.toInt().toString()
                : dailyAllowance.dailyRate.toString(),
          ),
        ],
        fuel: fuel == null
            ? null
            : UpdateFuelExpenseRequest(
                id: persistedReport?.trip?.fuel?.id ?? fuel.id,
                rate: fuel.rate,
                mileage: fuel.mileage,
                distance: fuel.distance,
              ),
        holidays: value.schedule!.holidays
            .map(
              (holiday) => UpdateScheduleHolidayRequest(
                date: holiday.date,
                isTravelOnly: holiday.isTravelOnly,
                compensatoryLeaveDate: holiday.compensatoryLeaveDate,
              ),
            )
            .toList(),
      );
      request = request.copyWith(trip: trip);
    } else if (value.schedule?.category is ScheduleOverseas) {
      final trip = UpdateTripReportRequest(
        expenses: value.expenses.indexed
            .map(
              (entry) => UpdateActualExpenseRequest(
                id: entry.$1 < (persistedReport?.trip?.expenses.length ?? 0)
                    ? persistedReport!.trip!.expenses[entry.$1].id
                    : entry.$2.id,
                stepId: entry.$2.stepId,
                currencyId: entry.$2.currencyId,
                price: entry.$2.price!,
                paymentDate: entry.$2.paymentDate,
                details: entry.$2.details,
              ),
            )
            .toList(),
        rates: value.rates.indexed
            .map(
              (entry) => UpdateRegulationRateRequest(
                id: entry.$1 < (persistedReport?.trip?.rates.length ?? 0)
                    ? persistedReport!.trip!.rates[entry.$1].id
                    : entry.$2.id,
                stepId: entry.$2.stepId,
                days: entry.$2.days!,
                rate: entry.$2.rate!,
                details: entry.$2.details,
              ),
            )
            .toList(),
        fuel: null,
      );
      request = request.copyWith(trip: trip);
    }

    return request;
  }

  Future<String> _uploadInlineImages({
    required appflowy.EditorState editorState,
    required int resourceId,
  }) async {
    final document = editorState.document;
    final map = <appflowy.Node, MultipartFile>{};

    void traverseNodes(appflowy.Node node) {
      if (node.type == appflowy.ImageBlockKeys.type) {
        final imageUrl =
            node.attributes[appflowy.ImageBlockKeys.url] as String?;
        if (imageUrl != null &&
            (imageUrl.startsWith('data:') ||
                !(Uri.tryParse(imageUrl)?.hasScheme ?? false))) {
          try {
            final bytes = base64Decode(imageUrl.split(',').last);
            final mimeType =
                lookupMimeType('', headerBytes: bytes) ??
                'application/octet-stream';
            final extension = extensionFromMime(mimeType) ?? 'jpeg';
            map[node] = MultipartFile.fromBytes(
              bytes,
              filename: '${node.id}.$extension',
              contentType: MediaType.parse(mimeType),
            );
          } catch (error) {
            debugPrint(
              'Image processing failed for node: ${node.id}, error: $error',
            );
          }
        }
      }

      for (final child in node.children) {
        traverseNodes(child);
      }
    }

    for (final node in document.root.children) {
      traverseNodes(node);
    }

    if (map.isNotEmpty) {
      final uploadResults = await ref
          .read(sftpRepositoryProvider)
          .uploadInlineImage(
            path: 'report',
            resourceId: resourceId,
            files: map.values.toList(),
          );
      final nodes = map.keys.toList();

      for (
        var index = 0;
        index < uploadResults.length && index < nodes.length;
        index++
      ) {
        nodes[index].updateAttributes({
          appflowy.ImageBlockKeys.url: uploadResults[index].url,
        });
      }
    }

    return appflowy.documentToMarkdown(document);
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

    final request = SendMailRequest(
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
