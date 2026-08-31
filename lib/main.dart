import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/firebase_options.dart';
import 'package:taskflow/src/app.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:idb_shim/idb_browser.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      GoRouter.optionURLReflectsImperativeAPIs = true;

      final database = await idbFactoryBrowser.open(
        'taskflow_drafts',
        version: 1,
        onUpgradeNeeded: (event) {
          final drafts = event.database.createObjectStore(
            'drafts',
            keyPath: 'id',
          );

          drafts.createIndex('by_user', 'userId');

          final assets = event.database.createObjectStore(
            'draft_assets',
            keyPath: 'id',
          );

          assets.createIndex('by_draft', 'draftId');
        },
      );
      final prefs = SharedPreferencesAsync();
      final ftoast = FToast();

      const environment = String.fromEnvironment(
        'ENVIRONMENT',
        defaultValue: 'prod',
      );

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
              indexedDatabaseProvider.overrideWithValue(database),
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
                indexedDatabaseProvider.overrideWithValue(database),
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
