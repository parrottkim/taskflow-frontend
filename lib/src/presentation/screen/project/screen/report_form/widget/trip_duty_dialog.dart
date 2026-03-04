import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class TripDutyDialog extends ConsumerWidget {
  final int categoryId;

  const TripDutyDialog({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final filter = ref.watch(
      tripFilterControllerProvider(categoryId: categoryId),
    );

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Column(
          children: [
            Expanded(
              child: switch (filter) {
                AsyncData(:final value) => ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, bottom: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.directions_run_rounded,
                            size: 20.0,
                            color: colorScheme.primary,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '당일 출장',
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _AllowanceCard(dayType: '주중', title: '당일 출장'),
                    SizedBox(height: 8.0),
                    _AllowanceCard(
                      dayType: '주말',
                      title: '회사 정상근무',
                      extra: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 11)
                          ?.rate,
                      off: '1.0',
                    ),
                    SizedBox(height: 8.0),
                    _AllowanceCard(
                      dayType: '주말',
                      title: '근거리 당일 출장',
                      extra: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 11)
                          ?.rate,
                      off: '1.0',
                    ),
                    SizedBox(height: 8.0),
                    _AllowanceCard(
                      dayType: '주말',
                      title: '원거리 당일 출장 (울산/광주)',
                      allowance: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 10)
                          ?.rate,
                      extra: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 11)
                          ?.rate,
                      off: '1.0',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, bottom: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.hotel_rounded,
                            size: 20.0,
                            color: colorScheme.primary,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '숙박 포함 출장',
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _AllowanceCard(dayType: '주중', title: '근무 없이 단순 이동일'),
                    SizedBox(height: 8.0),
                    _AllowanceCard(
                      dayType: '주중',
                      title: '회사/공장 근무 포함 이동',
                      allowance: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 10)
                          ?.rate,
                    ),
                    SizedBox(height: 8.0),
                    _AllowanceCard(
                      dayType: '주말',
                      title: '근무 없이 단순 이동 (토요일 등)',
                      allowance: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 10)
                          ?.rate,
                      off: '0.5',
                    ),
                    SizedBox(height: 8.0),
                    _AllowanceCard(
                      dayType: '주말',
                      title: '회사/공장 근무 포함 이동',
                      allowance: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 10)
                          ?.rate,
                      extra: value.regulations
                          .firstWhereOrNull((e) => e.stepId == 11)
                          ?.rate,
                      off: '1.0',
                    ),
                  ],
                ),
                _ => SizedBox(),
              },
            ),
            Divider(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(Intl.message('common_close')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AllowanceCard extends StatelessWidget {
  final String dayType;
  final String title;
  final String? allowance;
  final String? extra;
  final String? off;

  const _AllowanceCard({
    required this.dayType,
    required this.title,
    this.allowance,
    this.extra,
    this.off,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    bool isWeekend = dayType == '주말';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단: 요일 태그 + 제목
          Row(
            children: [
              SizedBox(
                width: 42,
                child: Text(
                  dayType,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isWeekend ? colorScheme.error : colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              height: 1,
              color: colorScheme.surfaceContainerHighest,
            ),
          ),
          // 하단: 수당 정보 (가로로 넓게 배치)
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: [
              if (allowance == null)
                _StatusChip(
                  label: '일비 0 (실비)',
                  bgColor: const Color(0xFFF1F3F5),
                  textColor: const Color(0xFF646E7A),
                ),
              if (allowance != null)
                _StatusChip(
                  label: '일비 $allowance',
                  bgColor: const Color(0xFFE7F5FF),
                  textColor: const Color(0xFF1971C2),
                ),
              if (extra != null)
                _StatusChip(
                  label: '특근비 $extra',
                  bgColor: const Color(0xFFFFF4E6),
                  textColor: const Color(0xFFE67700),
                ),
              if (off != null)
                _StatusChip(
                  label: '대체 휴무 $off',
                  bgColor: const Color(0xFFEBFBEE),
                  textColor: const Color(0xFF2B8A3E),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;

  const _StatusChip({
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: brightness == Brightness.light ? bgColor : textColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          color: brightness == Brightness.light ? textColor : bgColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
