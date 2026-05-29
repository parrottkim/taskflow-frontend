part of '../controller.dart';

@riverpod
class UserFilterController extends _$UserFilterController {
  Timer? _debounce;

  @override
  FutureOr<UserFilterState> build() async {
    ref.onDispose(() => _debounce?.cancel());

    return _init();
  }

  Future<UserFilterState> _init() async {
    final departments = await ref
        .read(userRepositoryProvider)
        .getAllDepartments();
    final positions = await ref.read(userRepositoryProvider).getAllPositions();

    return UserFilterState(
      departmentItems: departments,
      positionItems: positions,
    );
  }

  void setSearch({String? search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void updateSearch({String? search}) {
    final value = state.value;

    if (value == null) return;

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      state = AsyncValue.data(value.copyWith(search: search));
    });
  }

  void updatePosition({UserPosition? position}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncValue.data(value.copyWith(position: position));
  }

  void updateDepartment({UserDepartment? department}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncValue.data(value.copyWith(department: department));
  }
}
