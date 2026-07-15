part of '../controller.dart';

@riverpod
class WorkFilterController extends _$WorkFilterController {
  @override
  WorkFilterState build() => WorkFilterState();

  void init({String? view}) {
    state = state.copyWith(view: view);
  }

  void setView({String? view}) {
    state = state.copyWith(view: view);
  }
}
