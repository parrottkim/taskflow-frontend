import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/presentation/screen/auth/register/widget/password_invalid_widget.dart';
import 'package:taskflow/src/presentation/screen/auth/register/widget/terms_and_agreement_widget.dart';
import 'package:taskflow/src/shared/tool/validation.dart';

class RegisterFormWidget extends HookConsumerWidget {
  final String? path;

  const RegisterFormWidget({super.key, this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final username = useValueListenable(usernameController);
    final email = useValueListenable(emailController);
    final password = useValueListenable(passwordController);

    final usernameFocus = useFocusNode();
    final emailFocus = useFocusNode();
    final passwordFocus = useFocusNode();

    final passwordVisibility = useState<bool>(false);
    final validationItems = useState(
      WidgetPreset(context).passwordValidationItems,
    );

    final termsAndAgreement = useState<bool>(false);

    useEffect(() {
      final newItems = validationItems.value.map((item) {
        final isMatch = password.text.contains(item.regex);
        return item.copyWith(flag: isMatch);
      }).toList();
      validationItems.value = newItems;

      return null;
    }, [password]);

    Future<void> register() async {
      TextInput.finishAutofillContext();
      final request = RegisterRequest(
        username: username.text,
        email: email.text,
        password: password.text,
      );
      await ref
          .read(authControllerProvider.notifier)
          .register(request: request);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64.0),
              Text(
                Intl.message('register_headline'),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 4.0),
              Text(Intl.message('register_title')),
            ],
          ),
          const SizedBox(height: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intl.message('register_username'),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: usernameController,
                focusNode: usernameFocus,
                onSubmitted: (_) => emailFocus.requestFocus(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstCurve: Curves.easeInQuad,
                      secondCurve: Curves.easeInQuad,
                      crossFadeState: Validation.isUsernameValid(username.text)
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: const Icon(
                        Symbols.check_circle_rounded,
                        fill: 1.0,
                        color: Color(0xFF47A34B),
                      ),
                      secondChild: Icon(
                        Symbols.cancel_rounded,
                        fill: 1.0,
                        color: colorScheme.error,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                Intl.message('register_email'),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: emailController,
                focusNode: emailFocus,
                onSubmitted: (_) => passwordFocus.requestFocus(),
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.username],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  error:
                      email.text.isNotEmpty &&
                          !Validation.isEmailValid(email.text)
                      ? SizedBox.shrink()
                      : null,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstCurve: Curves.easeInQuad,
                      secondCurve: Curves.easeInQuad,
                      crossFadeState: Validation.isEmailValid(email.text)
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: const Icon(
                        Symbols.check_circle_rounded,
                        fill: 1.0,
                        color: Color(0xFF47A34B),
                      ),
                      secondChild: Icon(
                        Symbols.cancel_rounded,
                        fill: 1.0,
                        color: colorScheme.error,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                Intl.message('register_password'),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: passwordController,
                focusNode: passwordFocus,
                onSubmitted:
                    Validation.isUsernameValid(username.text) &&
                        Validation.isEmailValid(email.text) &&
                        Validation.isPasswordValid(password.text)
                    ? (_) => register()
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
              ),
            ],
          ),
          SizedBox(height: 24.0),
          PasswordInvalidWidget(
            password: password.text,
            items: validationItems.value,
          ),
          TermsAndAgreementWidget(termsAndAgreement: termsAndAgreement),
          const SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  Validation.isUsernameValid(username.text) &&
                      Validation.isEmailValid(email.text) &&
                      Validation.isPasswordValid(password.text) &&
                      termsAndAgreement.value
                  ? () => register()
                  : null,
              child: Text(Intl.message('register_button')),
            ),
          ),
        ],
      ),
    );
  }
}
