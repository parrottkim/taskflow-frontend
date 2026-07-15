part of '../controller.dart';

@riverpod
class AccountFilterController extends _$AccountFilterController {
  @override
  AccountFilterState build() => AccountFilterState();

  void init({String? view}) {
    state = state.copyWith(view: view);
  }

  void setView({String? view}) {
    state = state.copyWith(view: view);
  }
}
