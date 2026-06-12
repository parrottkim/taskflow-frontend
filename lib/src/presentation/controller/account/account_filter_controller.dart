part of '../controller.dart';

@riverpod
class AccountFilterController extends _$AccountFilterController {
  @override
  FutureOr<AccountFilterState> build() async {
    return await _init();
  }

  Future<AccountFilterState> _init() async {
    return AccountFilterState();
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
