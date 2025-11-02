part of '../controller.dart';

@riverpod
class ProjectDetailFilterController extends _$ProjectDetailFilterController {
  @override
  FutureOr<ProjectDetailFilterState> build() async {
    return await _init();
  }

  Future<ProjectDetailFilterState> _init() async {
    return ProjectDetailFilterState();
  }

  Future<void> init({String? view}) async {
    final value = await future;

    state = AsyncData(value.copyWith(view: view));
  }

  void setView({String? view}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(view: view));
  }

  Map<String, String?> toQueryParameters() {
    final value = state.valueOrNull;

    if (value == null) return {};

    final queryParameters = {
      if (value.view != null) 'view': value.view,
    };

    return queryParameters;
  }
}
