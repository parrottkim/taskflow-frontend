part of '../widget.dart';

extension AuthWidgetPreset on WidgetPreset {
  List<ValidationItem> get passwordValidationItems => [
    ValidationItem(
      label: Intl.message('register_password_validation_1'),
      regex: RegExp(r'^.{8,}$'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_2'),
      regex: RegExp(r'[A-Z]'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_3'),
      regex: RegExp(r'[a-z]'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_4'),
      regex: RegExp(r'[0-9]'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_5'),
      regex: RegExp(r'[!@#\$%^&*(),.?":{}|<>]'),
      flag: false,
    ),
  ];
}
