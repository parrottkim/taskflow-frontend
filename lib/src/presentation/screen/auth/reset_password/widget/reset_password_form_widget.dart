import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/auth/register/widget/password_invalid_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/validation.dart';

class ResetPasswordFormWidget extends HookConsumerWidget {
  final String? path;
  final String? token;

  const ResetPasswordFormWidget({super.key, this.path, this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final passwordController = useTextEditingController();
    final password = useValueListenable(passwordController);

    final passwordVisibility = useState<bool>(false);
    final validationItems = useState(
      UiConfiguration(context).passwordValidationItems,
    );

    useEffect(() {
      final newItems = validationItems.value.map((item) {
        final isMatch = password.text.contains(item.regex);
        return item.copyWith(flag: isMatch);
      }).toList();
      validationItems.value = newItems;

      return null;
    }, [password]);

    Future<void> request() async {
      if (token == null) return;

      final request = ResetPasswordRequest(
        token: token!,
        newPassword: password.text,
      );

      await ref
          .read(authControllerProvider.notifier)
          .resetPassword(request: request);

      context.goNamed(RouteNames.login);

      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              message: Intl.message('reset_password_success'),
              type: ToastType.verified,
            ),
          );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64.0),
          Text(
            Intl.message('reset_password_headline'),
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4.0),
          Text(Intl.message('reset_password_title')),
          const SizedBox(height: 24.0),
          Text(
            Intl.message('reset_password_password'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: passwordController,
            onSubmitted: Validation.isPasswordValid(password.text)
                ? (_) => request()
                : null,
            obscureText: !passwordVisibility.value,
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              error:
                  password.text.isNotEmpty &&
                      !Validation.isPasswordValid(password.text)
                  ? SizedBox.shrink()
                  : null,
              suffixIcon: password.text.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: AppIconButton(
                        onTap: () {
                          passwordVisibility.value = !passwordVisibility.value;
                        },
                        icon: Icon(
                          passwordVisibility.value
                              ? Symbols.visibility_off
                              : Symbols.visibility,
                          size: 20.0,
                          fill: 1.0,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(height: 24.0),
          PasswordInvalidWidget(
            password: password.text,
            items: validationItems.value,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: Validation.isPasswordValid(password.text)
                  ? () => request()
                  : null,
              child: Text(Intl.message('reset_password_button')),
            ),
          ),
        ],
      ),
    );
  }
}
