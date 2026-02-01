part of '../controller.dart';

@riverpod
class SettingFilterController extends _$SettingFilterController {
  @override
  FutureOr<SettingFilterState> build() async {
    return await _init();
  }

  Future<SettingFilterState> _init() async {
    return SettingFilterState();
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
