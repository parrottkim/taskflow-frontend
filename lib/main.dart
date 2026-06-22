import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/firebase_options.dart';
import 'package:taskflow/src/app.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  const secure = FlutterSecureStorage();
  final prefs = SharedPreferencesAsync();
  final ftoast = FToast();

  const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'prod',
  );

  // 2. runZonedGuarded 내부에서만 로직 수행
  await runZonedGuarded(
    () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: environment == 'local'
              ? Duration.zero
              : const Duration(hours: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();

      if (environment == 'local') {
        runApp(
          ProviderScope(
            overrides: [
              flutterSecureStorageProvider.overrideWithValue(secure),
              sharedPreferencesAsyncProvider.overrideWithValue(prefs),
              toastProvider.overrideWithValue(ftoast),
            ],
            child: App(),
          ),
        );
      } else {
        final sentryJson = json.decode(remoteConfig.getString('sentry'));
        await SentryFlutter.init(
          (options) {
            options.dsn = sentryJson[environment]['dsn'];
            options.sendDefaultPii = true;
            options.release = const String.fromEnvironment('SENTRY_RELEASE');
          },
          appRunner: () => runApp(
            ProviderScope(
              overrides: [
                flutterSecureStorageProvider.overrideWithValue(secure),
                sharedPreferencesAsyncProvider.overrideWithValue(prefs),
                toastProvider.overrideWithValue(ftoast),
              ],
              child: App(),
            ),
          ),
        );
      }
    },
    (exception, stackTrace) async {
      if (Sentry.isEnabled) {
        await Sentry.captureException(exception, stackTrace: stackTrace);
      }
    },
  );
}
