import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndAgreementWidget extends StatelessWidget {
  final ValueNotifier<bool> termsAndAgreement;

  const TermsAndAgreementWidget({super.key, required this.termsAndAgreement});

  @override
  Widget build(BuildContext context) {
    return AppToggleButton(
      onChanged: (value) => termsAndAgreement.value = value,
      value: termsAndAgreement.value,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: Intl.message('register_agreement_1'),
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(
                      'https://chambray-cuticle-20b.notion.site/0556598f972b47f9a2a47146f52e0974?pvs=4',
                    ),
                  );
                },
            ),
            TextSpan(text: Intl.message('register_agreement_2')),
            TextSpan(
              text: Intl.message('register_agreement_3'),
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(
                      'https://chambray-cuticle-20b.notion.site/3565127c85594b26804a0365c82427eb?pvs=4',
                    ),
                  );
                },
            ),
            TextSpan(text: Intl.message('register_agreement_4')),
          ],
        ),
      ),
    );
  }
}
