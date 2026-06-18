import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/theme/theme.dart';
import 'package:taskflow/src/shared/tool/behavior.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider);
    final router = ref.watch(routerProvider);

    ref.listen(errorControllerProvider, (_, state) {
      switch (state) {
        case ErrorInitial():
          return;
        case ErrorUnauthorized() || ErrorForbidden():
          return ref.invalidate(errorControllerProvider);
        case ErrorTokenExpired(:final message):
          toast.showToast(
            child: Toast(type: ToastType.standard, message: message),
          );
          return ref.invalidate(errorControllerProvider);
        default:
          final String errorMessage = switch (state) {
            ErrorBadRequest(:final message) => message,
            ErrorNotFound(:final message) => message,
            ErrorConflict(:final message) => message,
            ErrorNotDefined(:final message) => message,
            _ => Intl.message('error_unexpected'),
          };

          toast.showToast(
            child: Toast(type: ToastType.error, message: errorMessage),
          );
          return ref.invalidate(errorControllerProvider);
      }
    });

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
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppFlowyEditorLocalizations.delegate,
      ],
      scrollBehavior: AppScrollBehavior(),
      themeMode: ThemeMode.system,
      routerConfig: router.config,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
