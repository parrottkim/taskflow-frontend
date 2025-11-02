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
import 'package:taskflow/src/shared/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/shared/tool/url_strategy/non_web_url_strategy.dart'
    if (dart.library.html) 'src/shared/tool/url_strategy/web_url_strategy.dart';

Future<void> main() async {
  configureUrl();
  WidgetsFlutterBinding.ensureInitialized();

  const secure = FlutterSecureStorage();
  final prefs = SharedPreferencesAsync();
  final ftoast = FToast();

  // 환경 변수 설정
  const environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: 'prod');

  if (environment == 'local') {
    return runApp(
      ProviderScope(
        overrides: [
          flutterSecureStorageProvider.overrideWithValue(secure),
          sharedPreferencesAsyncProvider.overrideWithValue(prefs),
          toastProvider.overrideWithValue(ftoast),
        ],
        child: App(),
      ),
    );
  }
  await runZonedGuarded(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // Remote Config 설정
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();

    final jsonValue = json.decode(remoteConfig.getString('sentry'));

    GoRouter.optionURLReflectsImperativeAPIs = true;

    // 비동기 작업 완료 후 Sentry 초기화
    await SentryFlutter.init(
      (options) {
        options.dsn = jsonValue[environment]['dsn'];
        options.sendDefaultPii = true;
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
  }, (exception, stackTrace) async {
    Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
