part of '../controller.dart';

@riverpod
class ReportFormController extends _$ReportFormController {
  @override
  FutureOr<ReportFormState> build(
      {required int projectId, int? reportId}) async {
    return await _init();
  }

  Future<ReportFormState> _init() async {
    if (reportId == null) {
      return ReportFormState();
    }

    final result =
        await ref.read(reportRepositoryProvider).getReport(id: reportId!);

    final steps = (result.schedule.category is ScheduleRemote)
        ? ['description']
        : [
            'transportation',
            'local_transportation',
            'accommodation',
            'daily_expense',
            'other',
            'description',
          ];

    return ReportFormState(
      expenses: result.trip?.expenses ?? [],
      rates: result.trip?.rates ?? [],
      fuel: result.trip?.fuel,
      isDeducted: result.trip?.isDeducted ?? false,
      content: result.content,
      attachments: result.attachments,
      schedule: result.schedule,
      steps: steps,
    );
  }

  void setSchedule({Schedule? schedule}) {
    final value = state.valueOrNull;

    if (value == null) return;

    if (schedule == null) {
      state = AsyncData(value.copyWith(schedule: null));
      return;
    }

    final steps = (schedule.category is ScheduleRemote)
        ? ['description']
        : [
            'transportation',
            'local_transportation',
            'accommodation',
            'daily_expense',
            'other',
            'description',
          ];

    state = AsyncData(ReportFormState(
      schedule: schedule,
      steps: steps,
    ));
  }

  void addActualExpense({TripActualExpense? item}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(expenses: [
      ...value.expenses, // 'trip' 필드 제거
      item ?? TripActualExpense.empty()
    ]));
  }

  void updateActualExpense(
      {required int index, String? price, String? details}) {
    final value = state.valueOrNull;

    if (value == null) return;

    final newItem = [...value.expenses];

    if (index >= 0 && index < newItem.length) {
      final oldItem = newItem[index];
      newItem[index] = oldItem.copyWith(
        price: price ?? oldItem.price,
        details: details ?? oldItem.details,
      );

      // 3. 정확한 타입의 copyWith를 호출하여 상태 업데이트
      state = AsyncData(value.copyWith(expenses: newItem));
    }
  }

  void removeActualExpense({required int index}) {
    final value = state.valueOrNull;

    if (value == null) return;

    final newItem = [...value.expenses];

    if (index >= 0 && index < newItem.length) {
      newItem.removeAt(index);
    } else {
      return;
    }

    state = AsyncData(value.copyWith(expenses: newItem));
  }

  // -----------------------------------------------------------------
  // ⭐️ [수정] rates 관련 메서드
  // -----------------------------------------------------------------

  void addRegulationRate({TripRegulationRate? item}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value
        .copyWith(rates: [...value.rates, item ?? TripRegulationRate.empty()]));
  }

  void updateRegulationRate(
      {required int index, String? days, String? rate, String? details}) {
    final value = state.valueOrNull;

    if (value == null) return;

    final newItem = [...value.rates];

    if (index >= 0 && index < newItem.length) {
      final oldItem = newItem[index];
      newItem[index] = oldItem.copyWith(
        days: days ?? oldItem.days,
        rate: rate ?? oldItem.rate,
        details: details ?? oldItem.details,
      );

      state = AsyncData(value.copyWith(rates: newItem));
    }
  }

  void removeRegulationRate({required int index}) {
    final value = state.valueOrNull;

    if (value == null) return;

    final newItem = [...value.rates];

    if (index >= 0 && index < newItem.length) {
      newItem.removeAt(index);
    } else {
      return;
    }

    state = AsyncData(value.copyWith(rates: newItem));
  }

  void setFuelExpense({String? rate, String? mileage, String? distance}) {
    final value = state.valueOrNull;

    if (value == null) return;

    // 현재 연료 객체를 가져옵니다.
    final currentFuel = value.fuel;

    // 1. 업데이트할 값을 결정합니다.
    final newRate = rate ?? currentFuel?.rate;
    final newMileage = mileage ?? currentFuel?.mileage;
    final newDistance = distance ?? currentFuel?.distance;

    // 2. 세 값이 모두 '유효하지 않은 상태'인지 확인합니다.
    // '유효하지 않은 상태'는 null이거나 빈 문자열("")인 경우를 의미합니다.
    final isRateEmpty = newRate == null || newRate.isEmpty;
    final isMileageEmpty = newMileage == null || newMileage.isEmpty;
    final isDistanceEmpty = newDistance == null || newDistance.isEmpty;

    if (isRateEmpty && isMileageEmpty && isDistanceEmpty) {
      // 3. 세 값이 모두 유효하지 않으면 fuel을 null로 설정합니다.
      state = AsyncData(value.copyWith(
        fuel: null, // 👈 null로 설정
      ));
    } else {
      // 4. 하나라도 유효한 값이 있으면 TripFuelExpense 객체를 업데이트합니다.

      // 업데이트를 위해 기존 fuel 객체가 null이면 새로 생성해야 합니다.
      final fuelToUpdate = currentFuel ?? TripFuelExpense();

      state = AsyncData(value.copyWith(
        fuel: fuelToUpdate.copyWith(
          // 인자로 받은 값이 null이면 업데이트하지 않고 기존 값을 사용합니다.
          // 여기서 newRate 등을 사용하지 않고 다시 rate/mileage/distance를 사용하는 이유는
          // 인자로 'null'이 들어오면 기존 값을 유지하고, '빈 문자열'이 들어오면 빈 문자열로 업데이트하기 위해서입니다.
          // (newRate 등은 기존 값을 채워넣은 상태입니다.)
          rate: rate ?? fuelToUpdate.rate,
          mileage: mileage ?? fuelToUpdate.mileage,
          distance: distance ?? fuelToUpdate.distance,
        ),
      ));
    }
  }

  void setDeducted({required bool flag}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(isDeducted: flag));
  }

  Future<void> serializeAndSetContent(
      {required MutableDocument document}) async {
    final Map<ImageNode, MultipartFile> map = {};
    final nodes = document.whereType<ImageNode>();

    for (final node in nodes) {
      try {
        final base64 = node.imageUrl.split(',').last;
        final bytes = base64Decode(base64);
        final mimeType = lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';

        final extension = extensionFromMime(mimeType) ?? 'jpeg';
        final filename = '${node.id}.$extension'; // 임시 파일명에 고유 ID 추가

        final multipartFile = MultipartFile.fromBytes(
          bytes,
          filename: filename,
          contentType: MediaType.parse(mimeType),
        );

        map[node] = multipartFile;
      } catch (e) {
        print('Image processing failed for node: ${node.id}, error: $e');
      }
    }

    // 2. 맵의 값(업로드할 파일 리스트)만 추출하여 일괄 업로드합니다.
    final files = map.values.toList();

    if (files.isNotEmpty) {
      try {
        final uploadResults = await ref
            .read(sftpRepositoryProvider)
            .uploadInlineImage(path: 'report', files: files);

        // 3. 업로드 결과를 순서대로 순회하며 문서의 노드를 업데이트합니다.
        final originalNodes = map.keys.toList();

        for (int i = 0; i < uploadResults.length; i++) {
          final originalNode = originalNodes[i];
          final uploadedUrl = uploadResults[i].url; // 서버에서 반환한 최종 URL

          final newNode = ImageNode(
            id: originalNode.id,
            imageUrl: uploadedUrl,
          );
          document.replaceNodeById(originalNode.id, newNode);
        }
      } catch (e) {
        print('Batch image upload failed, error: $e');
      }
    }

    // 4. 최종 문서를 Markdown으로 변환하고 상태를 업데이트합니다.
    final markdown = serializeDocumentToMarkdown(document,
        syntax: MarkdownSyntax.superEditor);

    print(markdown);

    state = AsyncData(state.valueOrNull!.copyWith(content: markdown));

    ref
        .read(reportValidationControllerProvider.notifier)
        .setContentValid(markdown.isEmpty);
  }

  void removeAttachment(ReportAttachment attachment) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(attachments: [
      ...value.attachments?.where((item) => item.id != attachment.id) ?? [],
    ]));
  }

  void addFile(XFile file) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(files: [...?value.files, file]));
  }

  void removeFile(XFile file) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(files: [
      ...value.files?.where((item) => item.path != file.path) ?? [],
    ]));
  }
}
