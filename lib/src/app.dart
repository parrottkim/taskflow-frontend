import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/theme/theme.dart';
import 'package:taskflow/src/shared/tool/behavior.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider);
    final router = ref.watch(routerProvider);
    final auth = ref.watch(authControllerProvider);

    final isSearchDialogOpen = useState(false);

    Future<void> openNavigationSearch() async {
      if (auth is! AuthAuthenticated) return;
      if (isSearchDialogOpen.value) return;

      final navigatorContext =
          router.config.routerDelegate.navigatorKey.currentContext;

      if (navigatorContext == null) return;

      isSearchDialogOpen.value = true;

      try {
        await showDialog<void>(
          context: navigatorContext,
          builder: (_) => const NavigationSearchDialog(),
        );
      } finally {
        isSearchDialogOpen.value = false;
      }
    }

    ref.listen(errorControllerProvider, (_, state) {
      switch (state) {
        case ErrorInitial():
          return;

        case ErrorUnauthorized(:final message) ||
            ErrorForbidden(:final message):
          if (router.config.name != RouteNames.login) {
            toast.removeQueuedCustomToasts();
            toast.showToast(
              child: Toast(type: ToastType.error, message: message),
            );
          }

        case ErrorTokenExpired(:final message):
          toast.removeQueuedCustomToasts();
          toast.showToast(
            child: Toast(type: ToastType.standard, message: message),
          );

        case ErrorBadRequest(:final message) ||
            ErrorNotFound(:final message) ||
            ErrorConflict(:final message) ||
            ErrorTooManyRequests(:final message) ||
            ErrorConnectionError(:final message) ||
            ErrorConnectionTimeout(:final message) ||
            ErrorNotDefined(:final message):
          toast.removeQueuedCustomToasts();
          toast.showToast(
            child: Toast(type: ToastType.error, message: message),
          );
      }

      ref.invalidate(errorControllerProvider);
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => CallbackShortcuts(
        bindings: {
          // Windows / Linux
          const SingleActivator(LogicalKeyboardKey.keyK, control: true):
              openNavigationSearch,

          // macOS
          const SingleActivator(LogicalKeyboardKey.keyK, meta: true):
              openNavigationSearch,
        },
        child: Focus(
          debugLabel: 'app-shortcuts',
          autofocus: true,
          skipTraversal: true,
          child: Overlay(
            initialEntries: [
              if (child != null) ...[
                OverlayEntry(
                  builder: (context) => Consumer(
                    builder: (_, ref, _) {
                      toast.init(context);
                      return child;
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
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
