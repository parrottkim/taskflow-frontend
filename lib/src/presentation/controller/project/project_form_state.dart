part of '../controller.dart';

@freezed
abstract class ProjectFormState with _$ProjectFormState {
  factory ProjectFormState({
    List<Client>? clients,
    String? code,
    String? name,
    User? manager,
    @Default(false) bool isPreexecuted,
    @Default(false) bool isContracted,
    @Default(false) bool isAllClientSelected,
    @Default(false) bool isDirty,
  }) = _ProjectFormState;
}
