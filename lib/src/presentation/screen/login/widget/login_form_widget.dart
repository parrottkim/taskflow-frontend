import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/presentation/screen/login/widget/login_invalid_widget.dart';
import 'package:taskflow/src/router/router.dart';

class LoginFormWidget extends HookConsumerWidget {
  final String? path;

  const LoginFormWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final email =
        useListenableSelector(emailController, () => emailController.text);
    final password = useListenableSelector(
        passwordController, () => passwordController.text);

    final emailFocus = useFocusNode();
    final passwordFocus = useFocusNode();

    final passwordVisibility = useState<bool>(false);
    final isInvalid = useState<bool>(false);

    ref.listen(authControllerProvider, (_, state) {
      if (state is AuthFailed) {
        isInvalid.value = true;
      }
    });

    login() async {
      TextInput.finishAutofillContext();
      final login = LoginRequest(email: email, password: password);
      await ref.read(authControllerProvider.notifier).login(login: login);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            constraints: const BoxConstraints(maxWidth: 440.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Logo(),
                    SizedBox(height: 48.0),
                    Text(
                      Intl.message('login_headline'),
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(Intl.message('login_title')),
                    SizedBox(height: 48.0),
                  ],
                ),
                AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Intl.message('login_email'),
                        style: Theme.of(
                          context,
                        )
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        controller: emailController,
                        focusNode: emailFocus,
                        onSubmitted: (text) => passwordFocus.requestFocus(),
                        onChanged: (text) => isInvalid.value = false,
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        Intl.message('login_password'),
                        style: Theme.of(
                          context,
                        )
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        onSubmitted: email.isNotEmpty && password.isNotEmpty
                            ? (text) => login()
                            : null,
                        onChanged: (text) => isInvalid.value = false,
                        obscureText: !passwordVisibility.value,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: const [AutofillHints.password],
                        decoration: InputDecoration(
                          suffixIcon: password.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: CustomIconButton(
                                    onTap: () {
                                      passwordVisibility.value =
                                          !passwordVisibility.value;
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
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 24.0),
                      LoginInvalidWidget(visible: isInvalid.value),
                      CustomToggleButton(
                        value: ref
                            .watch(localControllerProvider)
                            .value
                            ?.persistLogin,
                        onChanged: (value) async => await ref
                            .read(localControllerProvider.notifier)
                            .setPersistLogin(flag: value ?? false),
                        child: Text(
                          Intl.message('login_persist'),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () => login(),
                          child: Text(Intl.message('login_button')),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Intl.message('login_create_account_1')),
                            SizedBox(width: 8.0),
                            CustomTextButton(
                              onPressed: () => context.goNamed(
                                RouteNames.register,
                                queryParameters: {
                                  if (path != null) 'redirect_to': path
                                },
                              ),
                              text: Intl.message('login_create_account_2'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
