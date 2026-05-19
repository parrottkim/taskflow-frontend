import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/validation.dart';

class PasswordFormWidget extends HookConsumerWidget {
  final String? path;

  const PasswordFormWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final emailController = useTextEditingController();
    final email = useValueListenable(emailController);

    // 1분 카운트다운 상태
    final countdown = useState<int>(0);

    // 1초마다 감소시키는 타이머
    useEffect(() {
      if (countdown.value > 0) {
        final timer = Timer.periodic(const Duration(seconds: 1), (t) {
          countdown.value -= 1;
          if (countdown.value <= 0) {
            t.cancel();
          }
        });
        return timer.cancel;
      }
      return null;
    }, [countdown.value]);

    Future<void> request() async {
      if (countdown.value > 0) return; // 아직 제한 시간 내면 요청 막기

      countdown.value = 60;

      final request = ForgotPasswordDto(email: email.text);
      await ref
          .read(authControllerProvider.notifier)
          .forgotPassword(request: request);

      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              message: Intl.message('forgot_password_requested'),
              type: ToastType.verified,
            ),
          );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64.0),
          Text(
            Intl.message('forgot_password_headline'),
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4.0),
          Text(Intl.message('forgot_password_title')),
          const SizedBox(height: 24.0),
          Text(
            Intl.message('forgot_password_email'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: emailController,
            onSubmitted: Validation.isEmailValid(email.text)
                ? (text) => request()
                : null,
            autofillHints: [AutofillHints.email],
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  Validation.isEmailValid(email.text) && countdown.value == 0
                  ? () => request()
                  : null,
              child: countdown.value == 0
                  ? Text(Intl.message('forgot_password_button'))
                  : Text(
                      Intl.message(
                        'forgot_password_delay',
                        args: [countdown.value],
                        name: 'forgot_password_delay',
                        desc: '비밀번호 재설정 요청 후 대기 시간 안내',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
