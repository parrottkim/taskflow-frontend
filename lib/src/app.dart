import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/theme/theme.dart';
import 'package:taskflow/src/shared/tool/behavior.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Overlay(
        initialEntries: [
          if (child != null) ...[
            OverlayEntry(
              builder: (context) => Consumer(
                builder: (_, ref, __) {
                  toast.init(context);
                  return child;
                },
              ),
            ),
          ],
        ],
      ),
      title: 'Taskflow',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
      scrollBehavior: AppScrollBehavior(),
      themeMode: ThemeMode.system,
      routerConfig: router.config,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
