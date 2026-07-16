part of '../controller.dart';

@freezed
abstract class DocumentDetailState with _$DocumentDetailState {
  factory DocumentDetailState({required Document document}) =
      _DocumentDetailState;
}
