import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProgressWidget extends ConsumerWidget {
  final int currentIndex;
  final List<String> steps;

  const ProgressWidget({
    super.key,
    required this.currentIndex,
    required this.steps,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Responsive(
      desktop: _DesktopWidget(
        currentIndex: currentIndex,
        steps: steps,
      ),
      mobile: _MobileWidget(
        currentIndex: currentIndex,
        steps: steps,
      ),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final int currentIndex;
  final List<String> steps;

  const _DesktopWidget({
    required this.currentIndex,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      child: Row(
        children: List.generate(
          steps.length * 2 - 1,
          (index) {
            if (index.isEven) {
              final stepIndex = index ~/ 2;

              final isCompleted = stepIndex < currentIndex;

              return Expanded(
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuad,
                  tween: Tween<double>(
                    begin: 0.0,
                    end: isCompleted ? 1.0 : 0.0,
                  ),
                  builder: (context, value, _) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        value: value,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${Intl.message('report_form_step')} ${stepIndex + 1}',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isCompleted
                              ? colorScheme.primary
                              : colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        Intl.message('report_form_${steps[stepIndex]}'),
                        style: TextStyle(
                          color: isCompleted
                              ? colorScheme.onSurface
                              : colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox(width: 8.0);
            }
          },
        ),
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final int currentIndex;
  final List<String> steps;

  const _MobileWidget({
    required this.currentIndex,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              steps.length * 2 - 1,
              (index) {
                if (index.isEven) {
                  final stepIndex = index ~/ 2;

                  final isCompleted = stepIndex < currentIndex;

                  return Expanded(
                    child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutQuad,
                        tween: Tween<double>(
                          begin: 0.0,
                          end: isCompleted ? 1.0 : 0.0,
                        ),
                        builder: (context, value, _) => LinearProgressIndicator(
                              value: value,
                              borderRadius: BorderRadius.circular(4.0),
                            )),
                  );
                } else {
                  return SizedBox(width: 8.0);
                }
              },
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                '${Intl.message('report_form_step')} ${currentIndex + 1}/${steps.length}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(width: 4.0),
              Text(
                Intl.message('report_form_${steps[currentIndex]}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
