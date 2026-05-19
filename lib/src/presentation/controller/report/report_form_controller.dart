part of '../controller.dart';

@riverpod
class ReportFormController extends _$ReportFormController {
  @override
  FutureOr<ReportFormState> build({
    required int projectId,
    int? reportId,
    int? scheduleId,
  }) => _init();

  Future<ReportFormState> _init() async {
    // reportId가 있으면 기존 보고서 로드
    if (reportId != null) {
      final result = await ref
          .read(reportRepositoryProvider)
          .getReport(id: reportId!);

      return ReportFormState(
        expenses: result.trip?.expenses ?? [],
        rates: result.trip?.rates ?? [],
        fuel: result.trip?.fuel,
        isDeducted: result.trip?.isDeducted ?? false,
        content: result.content,
        attachments: result.attachments,
        schedule: result.schedule,
      );
    }

    // scheduleId가 있으면 해당 스케줄 로드
    if (scheduleId != null) {
      final schedule = await ref
          .read(scheduleRepositoryProvider)
          .getSchedule(id: scheduleId!);

      return ReportFormState(schedule: schedule);
    }

    return ReportFormState();
  }

  void addActualExpense({TripActualExpense? item}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        expenses: [
          ...value.expenses, // 'trip' 필드 제거
          item ?? TripActualExpense.empty(),
        ],
      ),
    );
  }

  void updateActualExpense({
    required int index,
    String? price,
    String? details,
  }) {
    final value = state.value;

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
    final value = state.value;

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
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        rates: [...value.rates, item ?? TripRegulationRate.empty()],
      ),
    );
  }

  void updateRegulationRate({
    required int index,
    String? days,
    String? rate,
    String? details,
  }) {
    final value = state.value;

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
    final value = state.value;

    if (value == null) return;

    final newRates = [...value.rates];

    if (index >= 0 && index < newRates.length) {
      // 삭제할 rate의 stepId 가져오기
      final stepIdToRemove = newRates[index].stepId;
      newRates.removeAt(index);

      // 동일한 stepId를 가진 expenses도 함께 삭제
      final newExpenses = value.expenses
          .where((expense) => expense.stepId != stepIdToRemove)
          .toList();

      state = AsyncData(value.copyWith(rates: newRates, expenses: newExpenses));
    } else {
      return;
    }
  }

  void setFuelExpense({String? rate, String? mileage, String? distance}) {
    final value = state.value;

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
      state = AsyncData(
        value.copyWith(
          fuel: null, // 👈 null로 설정
        ),
      );
    } else {
      // 4. 하나라도 유효한 값이 있으면 TripFuelExpense 객체를 업데이트합니다.

      // 업데이트를 위해 기존 fuel 객체가 null이면 새로 생성해야 합니다.
      final fuelToUpdate = currentFuel ?? TripFuelExpense();

      state = AsyncData(
        value.copyWith(
          fuel: fuelToUpdate.copyWith(
            // 인자로 받은 값이 null이면 업데이트하지 않고 기존 값을 사용합니다.
            // 여기서 newRate 등을 사용하지 않고 다시 rate/mileage/distance를 사용하는 이유는
            // 인자로 'null'이 들어오면 기존 값을 유지하고, '빈 문자열'이 들어오면 빈 문자열로 업데이트하기 위해서입니다.
            // (newRate 등은 기존 값을 채워넣은 상태입니다.)
            rate: rate ?? fuelToUpdate.rate,
            mileage: mileage ?? fuelToUpdate.mileage,
            distance: distance ?? fuelToUpdate.distance,
          ),
        ),
      );
    }
  }

  void setDeducted({required bool flag}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(isDeducted: flag));
  }

  void setContent(String markdown) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(content: markdown));

    ref
        .read(reportValidationControllerProvider.notifier)
        .setContentValid(markdown.trimRight().isEmpty);
  }

  void removeAttachment(ReportAttachment attachment) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        attachments: [
          ...value.attachments?.where((item) => item.id != attachment.id) ?? [],
        ],
      ),
    );
  }

  void addFile(XFile file) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(files: [...?value.files, file]));
  }

  void removeFile(XFile file) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        files: [...value.files?.where((item) => item.path != file.path) ?? []],
      ),
    );
  }
}
