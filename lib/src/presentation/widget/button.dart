part of 'widget.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final double padding;
  final Color? backgroundColor;

  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.padding = 4.0,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconTheme(
      data: IconThemeData(
        weight: 400.0,
        opticalSize: 24.0,
        color: colorScheme.onSurface.withValues(
          alpha: onTap != null ? 0.7 : 0.3,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Ink(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: backgroundColor,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}

class CustomSvgIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String asset;
  final double padding;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool matchTextDirection;
  final String? semanticsLabel;
  final bool preserveSvgColor;

  const CustomSvgIconButton({
    super.key,
    required this.onTap,
    required this.asset,
    this.padding = 4.0,
    this.backgroundColor = Colors.transparent,
    this.iconColor,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
    this.semanticsLabel,
    this.preserveSvgColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveIconColor =
        iconColor ??
        colorScheme.onSurface.withValues(alpha: onTap != null ? 0.7 : 0.3);

    return CustomIconButton(
      onTap: onTap,
      padding: padding,
      backgroundColor: backgroundColor,
      icon: SvgPicture.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        matchTextDirection: matchTextDirection,
        semanticsLabel: semanticsLabel,
        colorFilter: preserveSvgColor
            ? null
            : ColorFilter.mode(effectiveIconColor, BlendMode.srcIn),
      ),
    );
  }
}

class ElevatedIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final IconData icon;
  final double? size;
  final double? fill;

  // 1. 색상 제어를 위한 파라미터 추가
  final Color? iconColor;
  final Color? backgroundColor;

  const ElevatedIconButton({
    super.key,
    required this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.all(4.0),
    required this.icon,
    this.size,
    this.fill,
    this.iconColor, // 추가
    this.backgroundColor, // 추가
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEnabled = onTap != null;

    // 2. 배경 색상 결정 논리
    // 외부지정 색상이 있다면 최우선 적용, 없으면 활성/비활성 기본 테마 적용
    final effectiveBackgroundColor =
        backgroundColor ??
        (isEnabled
            ? colorScheme.surfaceBright
            : colorScheme.onSurface.withValues(alpha: 0.1));

    // 3. 아이콘 색상 결정 논리
    // 외부지정 색상이 있다면 최우선 적용, 없으면 활성/비활성 기본 테마 적용
    final effectiveIconColor =
        iconColor ??
        (isEnabled
            ? colorScheme.onSurface.withValues(alpha: 0.7)
            : colorScheme.onSurface.withValues(alpha: 0.38));

    return Material(
      elevation: isEnabled ? 1.0 : 0.0,
      color: effectiveBackgroundColor, // 반영
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Icon(
            icon,
            fill: fill,
            size: size,
            color: effectiveIconColor, // 반영
          ),
        ),
      ),
    );
  }
}

class ToolbarButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final bool isHighlight;

  const ToolbarButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Icon(
          icon,
          size: 20.0,
          weight: isHighlight ? 600.0 : 300.0,
          color: isHighlight ? colorScheme.primary : colorScheme.onSurface,
        ),
      ),
    );
  }
}

class CustomToggleButton extends HookWidget {
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final bool? value; // 상위 위젯에서 관리하는 확정된 상태 값
  final double padding;
  final Widget? child;

  const CustomToggleButton({
    super.key,
    this.tristate = false,
    this.onChanged,
    this.value,
    this.padding = 6.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEnabled = onChanged != null;

    // 내부 상태(useState)를 완전히 지우고,
    // 클릭 시 '다음에 변경되어야 할 값'만 계산해서 부모에게 던집니다.
    void handleToggle() {
      if (!isEnabled) return;

      if (tristate) {
        // false -> null -> true -> false 순환 구조
        if (value == false) {
          onChanged!(null);
        } else if (value == null) {
          onChanged!(true);
        } else {
          onChanged!(false);
        }
      } else {
        // 일반 토글 (null인 경우 false로 안전하게 처리)
        onChanged!(!(value ?? false));
      }
    }

    return GestureDetector(
      onTap: isEnabled ? handleToggle : null,
      behavior: HitTestBehavior.opaque, // 글자 부분을 눌러도 작동하도록 터치 영역 확장
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.6,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. 체크박스 크기만큼 InkWell의 범위를 제한
            SizedBox(
              width: 20.0,
              height: 20.0,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isEnabled ? handleToggle : null,
                  // [핵심] 체크박스 겉에 InkWell을 두고 테두리를 4.0으로 깎음
                  borderRadius: BorderRadius.circular(4.0),
                  splashFactory: InkRipple.splashFactory,
                  child: Center(
                    // 2. InkWell의 자식으로 Checkbox를 배치하고 자체 이벤트는 차단
                    child: ExcludeFocus(
                      child: AbsorbPointer(
                        child: Checkbox(
                          tristate: tristate,
                          value: tristate ? value : (value ?? false),
                          onChanged: (_) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          side: BorderSide(
                            color: colorScheme.outline.withValues(alpha: 0.6),
                            width: 1,
                          ),
                          splashRadius: 0.0, // 순정 동그라미 스플래시 완전 차단
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: -4.0,
                            vertical: -4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (child != null)
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: child!, // 글자를 눌러도 GestureDetector 덕분에 물결 없이 깔끔하게 작동
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends HookWidget {
  final Function()? onPressed;
  final String text;

  const CustomTextButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isHover = useState(false);

    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: onPressed != null
                ? isHover.value
                      ? colorScheme.secondary
                      : colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
