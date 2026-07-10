part of '../controller.dart';

@riverpod
class ReportValidationController extends _$ReportValidationController {
  @override
  ReportValidationState build() => ReportValidationState();

  void setStepValid(int stepId, bool isInvalid) {
    final newMap = Map<int, bool>.from(state.stepValidations);
    newMap[stepId] = isInvalid;

    state = state.copyWith(stepValidations: newMap);
  }

  void setFuelValid(bool isInvalid) {
    state = state.copyWith(fuelInvalid: isInvalid);
  }

  void setContentValid(bool isInvalid) {
    state = state.copyWith(contentInvalid: isInvalid);
  }

  void updateAllValidationStatus({
    required int projectId,
    required int? reportId,
    required int? scheduleId,
  }) {
    // ReportFormController의 데이터를 읽어옵니다.
    final value = ref
        .read(
          reportFormControllerProvider(
            projectId: projectId,
            reportId: reportId,
            scheduleId: scheduleId,
          ),
        )
        .value;

    if (value == null || value.schedule == null) return;

    // TripStep ID 목록을 가져옵니다.
    final allSteps = ref.read(
      tripOptionsControllerProvider(categoryId: value.schedule!.category.id),
    );
    final stepIds = allSteps.value?.steps.map((s) => s.id).toList() ?? [];

    bool isInvalid = false;

    for (final stepId in stepIds) {
      final expenses = value.expenses.where((e) => e.stepId == stepId).toList();

      isInvalid = expenses.any(
        (item) => item.price == null || item.price!.isEmpty,
      );

      setStepValid(stepId, isInvalid);
    }

    // Fuel 유효성 검사 (사용자 코드 기반)
    final schedule = value.schedule;
    final fuel = value.fuel;

    final isFuelInvalid =
        schedule!.category is ScheduleDomestic &&
        fuel != null &&
        (fuel.rate == null ||
            fuel.rate!.isEmpty ||
            fuel.mileage == null ||
            fuel.mileage!.isEmpty ||
            fuel.distance == null ||
            fuel.distance!.isEmpty);

    // Fuel 유효성 상태 업데이트
    setFuelValid(isFuelInvalid);
  }

  // 3. ⭐️ 최종 유효성 확인 함수 수정 (로직 반전 수정)
  // 모든 stepValidations 값이 false (유효함)이고, fuelInvalid가 false (유효함)여야 true를 반환
  bool isValid() {
    // stepValidations의 모든 값이 false (유효함)인지 확인
    final isAllStepsValid = state.stepValidations.values.every(
      (isInvalid) => isInvalid == false,
    );

    // fuelInvalid가 false (유효함)인지 확인
    final isFuelValid = state.fuelInvalid == false;

    // 전체가 유효할 때만 true 반환
    return isAllStepsValid && isFuelValid;
  }
}
