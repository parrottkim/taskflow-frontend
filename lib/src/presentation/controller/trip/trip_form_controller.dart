part of '../controller.dart';

@riverpod
class TripFormController extends _$TripFormController {
  @override
  FutureOr<TripFormState> build({required int projectId, int? tripId}) async {
    return await _init();
  }

  Future<TripFormState> _init() async {
    if (tripId == null) {
      return TripFormState.domestic();
    }

    final result = await ref.read(tripRepositoryProvider).getTrip(id: tripId!);

    if (result.schedule.category is ScheduleDomestic) {
      return TripFormState.domestic(
        schedule: result.schedule,
        expenses: result.expenses,
        rates: result.rates,
        fuel: result.fuel,
      );
    } else {
      return TripFormState.overseas(
        schedule: result.schedule,
        expenses: result.expenses,
        rates: result.rates,
        isDeducted: result.isDeducted,
      );
    }
  }

  void setSchedule({Schedule? schedule}) {
    final value = state.valueOrNull;

    if (value == null) return;

    if (schedule == null) {
      state = AsyncData(value.copyWith(schedule: null));
      return;
    }

    if (schedule.category is ScheduleDomestic) {
      state = AsyncData(TripFormState.domestic(schedule: schedule));
    } else {
      state = AsyncData(TripFormState.overseas(schedule: schedule));
    }
  }

  void addActualExpense({TripActualExpense? item}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(
        expenses: [...value.expenses, item ?? TripActualExpense.empty()]));
  }

  void updateActualExpense(
      {required int index, String? price, String? details}) {
    final value = state.valueOrNull;

    if (value == null) return;

    final newItem = [...value.expenses];

    // 인덱스가 유효한지 확인
    if (index >= 0 && index < newItem.length) {
      final oldItem = newItem[index];
      newItem[index] = oldItem.copyWith(
        price: price ?? oldItem.price,
        details: details ?? oldItem.details,
      );
      state = AsyncData(value.copyWith(expenses: newItem));
    }
  }

  void removeActualExpense({required int index}) {
    final value = state.valueOrNull;

    if (value == null) return;

    final newItem = [...value.expenses];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItem.length) {
      newItem.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(expenses: newItem));
  }

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

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItem.length) {
      newItem.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(rates: newItem));
  }

  void setFuelExpense({String? rate, String? mileage, String? distance}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! TripFormDomestic) return;

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
    if (value is! TripFormOverseas) return;

    state = AsyncData(value.copyWith(isDeducted: flag));
  }
}
