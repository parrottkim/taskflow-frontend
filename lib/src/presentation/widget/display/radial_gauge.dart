part of '../widget.dart';

class RadialGauge extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double value;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const RadialGauge({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.value,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RadialGaugePainter(
          minValue: minValue,
          maxValue: maxValue,
          value: value,
          foregroundColor: foregroundColor ?? colorScheme.primary,
          backgroundColor:
              backgroundColor ?? colorScheme.outline.muted,
        ),
      ),
    );
  }
}

class RadialGaugePainter extends CustomPainter {
  final Color foregroundColor;
  final Color backgroundColor;
  final double minValue;
  final double maxValue;
  final double value;

  RadialGaugePainter({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.minValue,
    required this.maxValue,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 20;

    // 3/4 원(270°) 게이지: 시작 각도 135° (3π/4)에서 시작, 총 sweep 270° (3π/2)
    final double startAngle = 3 * pi / 4;
    final double totalSweepAngle = 3 * pi / 2;

    // 1. 배경 Arc: 전체 게이지 범위를 그리되, 둥근 끝(strokeCap: round)
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweepAngle,
      false,
      backgroundPaint,
    );

    // 2. Foreground Arc: 현재 value에 비례하여 진행률 표시
    final progressSweepAngle =
        totalSweepAngle * ((value - minValue) / (maxValue - minValue));
    final foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RadialGaugePainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.minValue != minValue ||
        oldDelegate.maxValue != maxValue ||
        oldDelegate.foregroundColor != foregroundColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
