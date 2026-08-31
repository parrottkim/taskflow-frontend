part of '../widget.dart';

// ==========================================
// 0. 공통 기반 다이얼로그 (BaseDialog)
// ==========================================
class BaseDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  final double maxWidth;
  final double? maxHeight;
  final bool showDivider;
  final bool fullScreen;
  final bool showTitle;
  // ⭐️ content를 감싸는 기본 패딩 속성 추가
  final EdgeInsetsGeometry contentPadding;

  const BaseDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.maxWidth = 430.0,
    this.maxHeight,
    this.showDivider = true,
    this.fullScreen = false,
    this.showTitle = true,
    // 기본값으로 좌우 16.0 패딩 지정
    this.contentPadding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final child = ContentContainer(
      width: fullScreen ? double.infinity : null,
      height: fullScreen ? double.infinity : null,
      borderWidth: fullScreen ? 0.0 : 1.0,
      borderRadius: fullScreen
          ? BorderRadius.zero
          : BorderRadius.circular(16.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      constraints: fullScreen
          ? null
          : BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight ?? double.infinity,
            ),
      child: Column(
        mainAxisSize: fullScreen ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            if (showDivider)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Divider(),
              )
            else
              const SizedBox(height: 16.0),
          ],

          // ⭐️ Content 영역
          // contentPadding 속성을 부여하여 외부 패딩 유연하게 제어
          Flexible(
            child: Padding(padding: contentPadding, child: content),
          ),

          if (showDivider)
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Divider(),
            )
          else
            const SizedBox(height: 16.0),

          // Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: actions.map((action) {
                final isLast = action == actions.last;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: isLast ? 0.0 : 4.0),
                    child: action,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );

    return fullScreen ? SizedBox.expand(child: child) : Dialog(child: child);
  }
}

class FullScreenDialogLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const FullScreenDialogLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w800,
        ),
        leading: AppIconButton(
          onTap: () => context.pop(),
          icon: const Icon(Symbols.chevron_left_rounded),
        ),
        title: Text(title),
      ),
      body: child,
    );
  }
}

// ==========================================
// 1. BaseDialog를 상속/활용한 알림창들
// ==========================================
class LoginForbiddenDialog extends StatelessWidget {
  const LoginForbiddenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Intl.message('login_forbidden_1'),
      content: Text(Intl.message('login_forbidden_2')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          child: Text(
            Intl.message('common_ok'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class LoginRequestDialog extends StatelessWidget {
  const LoginRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Intl.message('login_request_1'),
      content: Text(Intl.message('login_request_2')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          child: Text(
            Intl.message('common_ok'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class WrongApproachDialog extends StatelessWidget {
  const WrongApproachDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: Intl.message('wrong_approach_title'),
      content: Text(Intl.message('wrong_approach_content')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_ok'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class UnsavedChangesDialog extends StatelessWidget {
  const UnsavedChangesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: Intl.message('pop_scope_title'),
      content: Text(Intl.message('pop_scope_content')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(false),
          child: Text(
            Intl.message('common_stay'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_leave'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class DeleteDialog extends StatelessWidget {
  final String title;
  final String content;

  const DeleteDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: title,
      content: ContentContainer(
        borderRadius: BorderRadius.circular(8.0),
        color: colorScheme.errorContainer,
        borderColor: colorScheme.error,
        child: Row(
          children: [
            Icon(Symbols.warning_rounded, size: 20.0, color: colorScheme.error),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                content,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(false),
          child: Text(
            Intl.message('common_cancel'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_delete'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 2. 고유 레이아웃을 가진 특수 목적 다이얼로그들
// ==========================================

class ErrorDialog extends ConsumerWidget {
  final Object error;
  final StackTrace stackTrace;

  const ErrorDialog({super.key, required this.error, required this.stackTrace});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 430.0, maxHeight: 430.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                Intl.message('error_dialog_1'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$error',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text('$stackTrace'),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: '$error\n$stackTrace'),
                        );

                        ref
                            .read(toastProvider)
                            .showToast(
                              child: Toast(
                                type: ToastType.standard,
                                message: Intl.message('common_copied'),
                              ),
                            );
                      },
                      child: Text(
                        Intl.message('error_dialog_2'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
