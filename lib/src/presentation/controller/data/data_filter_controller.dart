part of '../controller.dart';

@riverpod
class DataFilterController extends _$DataFilterController {
  @override
  DataFilterState build() => DataFilterState();

  void init({String? view}) {
    state = state.copyWith(view: view);
  }

  void setView({String? view}) {
    state = state.copyWith(view: view);
  }
}
