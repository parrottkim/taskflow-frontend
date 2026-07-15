part of '../controller.dart';

@riverpod
class ProjectDetailFilterController extends _$ProjectDetailFilterController {
  @override
  ProjectDetailFilterState build() => ProjectDetailFilterState();

  void init({String? view}) {
    state = state.copyWith(view: view);
  }

  void setView({String? view}) {
    state = state.copyWith(view: view);
  }
}
