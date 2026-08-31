part of '../widget.dart';

extension PasswordValidationConfiguration on UiConfiguration {
  List<ValidationRule> get passwordValidationItems => [
    ValidationRule(
      label: Intl.message('register_password_validation_1'),
      regex: RegExp(r'^.{8,}$'),
      flag: false,
    ),
    ValidationRule(
      label: Intl.message('register_password_validation_2'),
      regex: RegExp(r'[A-Z]'),
      flag: false,
    ),
    ValidationRule(
      label: Intl.message('register_password_validation_3'),
      regex: RegExp(r'[a-z]'),
      flag: false,
    ),
    ValidationRule(
      label: Intl.message('register_password_validation_4'),
      regex: RegExp(r'[0-9]'),
      flag: false,
    ),
    ValidationRule(
      label: Intl.message('register_password_validation_5'),
      regex: RegExp(r'[!@#\$%^&*(),.?":{}|<>]'),
      flag: false,
    ),
  ];
}
