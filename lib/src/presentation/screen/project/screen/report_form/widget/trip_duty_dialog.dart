import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class TripDutyDialog extends StatelessWidget {
  const TripDutyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true, // 내용만큼만 높이 차지
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주중',
                    '당일 출장',
                    meal: '실비',
                  ),
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주말',
                    '회사 정상근무',
                    meal: '실비',
                    extra: '30,000',
                    off: '1.0',
                  ),
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주말',
                    '근거리 당일 출장',
                    meal: '실비',
                    extra: '30,000',
                    off: '1.0',
                  ),
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주말',
                    '원거리 당일 출장 (울산/광주)',
                    allowance: '35,000',
                    extra: '30,000',
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
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주중',
                    '근무 없이 단순 이동일',
                    meal: '실비',
                  ),
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주중',
                    '회사/공장 근무 포함 이동',
                    allowance: '35,000',
                  ),
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주말',
                    '근무 없이 단순 이동 (토요일 등)',
                    allowance: '35,000',
                    off: '0.5',
                  ),
                  _buildAllowanceCard(
                    colorScheme,
                    brightness,
                    '주말',
                    '회사/공장 근무 포함 이동',
                    allowance: '35,000',
                    extra: '30,000',
                    off: '1.0',
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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

  Widget _buildAllowanceCard(
    ColorScheme colorScheme,
    Brightness brightness,
    String dayType,
    String title, {
    String? meal,
    String? allowance,
    String? extra,
    String? off,
  }) {
    bool isWeekend = dayType == '주말';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
                  style: TextStyle(
                    color: isWeekend ? colorScheme.error : colorScheme.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
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
              if (meal != null)
                _buildStatusChip(
                  brightness,
                  '일비 0 ($meal)',
                  const Color(0xFFF1F3F5),
                  const Color(0xFF646E7A),
                ),
              if (allowance != null)
                _buildStatusChip(
                  brightness,
                  '일비 $allowance',
                  const Color(0xFFE7F5FF),
                  const Color(0xFF1971C2),
                ),
              if (extra != null)
                _buildStatusChip(
                  brightness,
                  '특근비 $extra',
                  const Color(0xFFFFF4E6),
                  const Color(0xFFE67700),
                ),
              if (off != null)
                _buildStatusChip(
                  brightness,
                  '대체 휴무 $off',
                  const Color(0xFFEBFBEE),
                  const Color(0xFF2B8A3E),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(
    Brightness brightness,
    String label,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: brightness == Brightness.light ? bgColor : textColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: brightness == Brightness.light ? textColor : bgColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
      ),
    );
  }
}
