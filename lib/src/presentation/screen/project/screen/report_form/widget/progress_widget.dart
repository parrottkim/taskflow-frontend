import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProgressWidget extends ConsumerWidget {
  final int currentIndex;
  final List<ReportFormStep> steps;

  const ProgressWidget({
    super.key,
    required this.currentIndex,
    required this.steps,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Responsive(
      desktop: _DesktopWidget(currentIndex: currentIndex, steps: steps),
      mobile: _MobileWidget(currentIndex: currentIndex, steps: steps),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final int currentIndex;
  final List<ReportFormStep> steps;

  const _DesktopWidget({required this.currentIndex, required this.steps});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const stepExtent = 56.0;
    const lastStepHeight = 40.0;
    const indicatorTop = 3.0;
    const indicatorCenter = 8.0;
    final trackHeight = (steps.length - 1) * stepExtent;
    final progress = steps.length <= 1
        ? 0.0
        : currentIndex / (steps.length - 1);

    return SizedBox(
      height: trackHeight + lastStepHeight,
      child: Stack(
        children: [
          if (steps.length > 1)
            Positioned(
              left: 9.0,
              top: indicatorCenter,
              width: 2.0,
              height: trackHeight,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutQuad,
                tween: Tween<double>(begin: 0.0, end: progress),
                builder: (context, value, _) => Stack(
                  children: [
                    Positioned.fill(
                      child: ColoredBox(color: colorScheme.outlineVariant),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      height: trackHeight * value,
                      child: ColoredBox(color: colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
          Column(
            children: List.generate(steps.length, (index) {
              final isCompleted = index < currentIndex;
              final isCurrent = index == currentIndex;
              final indicatorColor = isCompleted || isCurrent
                  ? colorScheme.primary
                  : colorScheme.outlineVariant;

              return SizedBox(
                height: index == steps.length - 1 ? lastStepHeight : stepExtent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: indicatorTop),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuad,
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: indicatorColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuad,
                            style: (textTheme.labelMedium ?? const TextStyle())
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isCompleted || isCurrent
                                      ? colorScheme.primary
                                      : colorScheme.outline,
                                ),
                            child: Text(
                              '${Intl.message('report_form_step')} ${index + 1}',
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuad,
                            style: (textTheme.bodyMedium ?? const TextStyle())
                                .copyWith(
                                  fontWeight: isCurrent
                                      ? FontWeight.w600
                                      : null,
                                  color: isCurrent
                                      ? colorScheme.onSurface
                                      : colorScheme.onSurfaceVariant,
                                ),
                            child: Text(
                              Intl.message('report_form_${steps[index].key}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final int currentIndex;
  final List<ReportFormStep> steps;

  const _MobileWidget({required this.currentIndex, required this.steps});

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
            children: List.generate(steps.length * 2 - 1, (index) {
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
                    ),
                  ),
                );
              } else {
                return SizedBox(width: 8.0);
              }
            }),
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
              Text(Intl.message('report_form_${steps[currentIndex].key}')),
            ],
          ),
        ],
      ),
    );
  }
}
