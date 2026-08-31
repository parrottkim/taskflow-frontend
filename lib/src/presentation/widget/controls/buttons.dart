part of '../widget.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final double padding;
  final Color? backgroundColor;
  final BorderRadius borderRadius;
  final double size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final double? opacity;
  final List<Shadow>? shadows;
  final bool? applyTextScaling;

  const AppIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.padding = 4.0,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.size = 24.0,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.opacity,
    this.shadows,
    this.applyTextScaling,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final skeletonSize = math.max(size, 24.0);

    return IconTheme(
      data: IconThemeData(
        size: size,
        fill: fill,
        weight: weight ?? 400.0,
        grade: grade,
        opticalSize: opticalSize ?? size,
        color:
            color ??
            (onTap != null
                ? colorScheme.onSurface.strong
                : colorScheme.onSurface.muted),
        opacity: opacity,
        shadows: shadows,
        applyTextScaling: applyTextScaling,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Ink(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: backgroundColor,
            ),
            child: SizedBox.square(
              dimension: skeletonSize,
              child: Center(
                child: Skeleton.replace(
                  replacement: Bone.circle(size: skeletonSize),
                  child: icon,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppSvgIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String asset;
  final double padding;
  final Color? backgroundColor;
  final Color? iconColor;
  final BorderRadius borderRadius;
  final double size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool matchTextDirection;
  final String? semanticsLabel;

  const AppSvgIconButton({
    super.key,
    required this.onTap,
    required this.asset,
    this.padding = 4.0,
    this.backgroundColor = Colors.transparent,
    this.iconColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.size = 24.0,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveIconColor =
        iconColor ??
        (onTap != null
            ? colorScheme.onSurface.strong
            : colorScheme.onSurface.muted);

    final effectiveWidth = width ?? size;
    final effectiveHeight = height ?? size;
    final buttonSize = math.max(
      math.max(effectiveWidth, effectiveHeight),
      24.0,
    );

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: SizedBox.square(
            dimension: buttonSize,
            child: Center(
              child: SvgPicture.asset(
                asset,
                width: effectiveWidth,
                height: effectiveHeight,
                fit: fit,
                alignment: alignment,
                matchTextDirection: matchTextDirection,
                semanticsLabel: semanticsLabel,
                placeholderBuilder: (_) => SizedBox(
                  width: effectiveWidth,
                  height: effectiveHeight,
                  child: Skeleton.replace(
                    replacement: Bone.circle(
                      size: math.min(effectiveWidth, effectiveHeight),
                    ),
                    child: const SizedBox.expand(),
                  ),
                ),
                colorFilter: ColorFilter.mode(
                  effectiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
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
        (isEnabled ? colorScheme.surfaceBright : colorScheme.onSurface.faint);

    // 3. 아이콘 색상 결정 논리
    // 외부지정 색상이 있다면 최우선 적용, 없으면 활성/비활성 기본 테마 적용
    final effectiveIconColor =
        iconColor ??
        (isEnabled
            ? colorScheme.onSurface.strong
            : colorScheme.onSurface.muted);

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
            border: Border.all(color: colorScheme.outline.subtle),
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

class AppToggleButton extends HookWidget {
  final bool tristate;
  final ValueChanged<bool>? _onChanged;
  final ValueChanged<bool?>? _onTristateChanged;
  final bool? value; // 상위 위젯에서 관리하는 확정된 상태 값
  final double padding;
  final Widget? child;
  final bool alignButtonToEnd;

  const AppToggleButton({
    super.key,
    ValueChanged<bool>? onChanged,
    this.value,
    this.padding = 6.0,
    this.child,
    this.alignButtonToEnd = false,
  }) : tristate = false,
       _onChanged = onChanged,
       _onTristateChanged = null;

  const AppToggleButton.tristate({
    super.key,
    ValueChanged<bool?>? onChanged,
    this.value,
    this.padding = 6.0,
    this.child,
    this.alignButtonToEnd = false,
  }) : tristate = true,
       _onChanged = null,
       _onTristateChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEnabled = tristate
        ? _onTristateChanged != null
        : _onChanged != null;

    // 내부 상태(useState)를 완전히 지우고,
    // 클릭 시 '다음에 변경되어야 할 값'만 계산해서 부모에게 던집니다.
    void handleToggle() {
      if (!isEnabled) return;

      if (tristate) {
        // Flutter Checkbox와 동일한 false -> true -> null -> false 순환 구조
        if (value == false) {
          _onTristateChanged!(true);
        } else if (value == true) {
          _onTristateChanged!(null);
        } else {
          _onTristateChanged!(false);
        }
      } else {
        // 일반 토글 (null인 경우 false로 안전하게 처리)
        _onChanged!(!(value ?? false));
      }
    }

    final button = SizedBox(
      width: 20.0,
      height: 20.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? handleToggle : null,
          borderRadius: BorderRadius.circular(4.0),
          splashFactory: InkRipple.splashFactory,
          child: Center(
            child: ExcludeFocus(
              child: AbsorbPointer(
                child: Checkbox(
                  tristate: tristate,
                  value: tristate ? value : (value ?? false),
                  onChanged: (_) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  side: BorderSide(color: colorScheme.outline.strong, width: 1),
                  splashRadius: 0.0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
    );

    return GestureDetector(
      onTap: isEnabled ? handleToggle : null,
      behavior: HitTestBehavior.opaque, // 글자 부분을 눌러도 작동하도록 터치 영역 확장
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.6,
        child: Row(
          mainAxisSize: alignButtonToEnd ? MainAxisSize.max : MainAxisSize.min,
          children: alignButtonToEnd
              ? [
                  if (child != null)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: padding),
                        child: child!,
                      ),
                    )
                  else
                    const Spacer(),
                  button,
                ]
              : [
                  button,
                  if (child != null)
                    Padding(
                      padding: EdgeInsets.only(left: padding),
                      child: child!,
                    ),
                ],
        ),
      ),
    );
  }
}

class AppTextButton extends HookWidget {
  final VoidCallback? onPressed;
  final String text;

  const AppTextButton({super.key, this.onPressed, required this.text});

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
                : colorScheme.onSurface.muted,
          ),
        ),
      ),
    );
  }
}
