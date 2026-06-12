part of '../controller.dart';

@riverpod
class DataFilterController extends _$DataFilterController {
  @override
  FutureOr<DataFilterState> build() async {
    return await _init();
  }

  Future<DataFilterState> _init() async {
    return DataFilterState();
  }

  Future<void> init({String? view}) async {
    final value = await future;

    state = AsyncData(value.copyWith(view: view));
  }

  void setView({String? view}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(view: view));
  }

  Map<String, String?> toQueryParameters() {
    final value = state.value;

    if (value == null) return {};

    final queryParameters = {if (value.view != null) 'view': value.view};

    return queryParameters;
  }
}
