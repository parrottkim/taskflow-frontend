import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
        color:
            colorScheme.onSurface.withValues(alpha: onTap != null ? 0.7 : 0.3),
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

class ElevatedIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final IconData icon;
  final double? size;
  final double? fill;

  const ElevatedIconButton({
    super.key,
    required this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.all(4.0),
    required this.icon,
    this.size,
    this.fill,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: onTap != null ? 1.0 : 0.0,
      color: onTap != null
          ? colorScheme.surfaceBright
          : colorScheme.onSurface.withValues(alpha: 0.1),
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
            color: onTap != null
                ? colorScheme.onSurface.withValues(alpha: 0.7)
                : colorScheme.onSurface.withValues(alpha: 0.38),
          ),
        ),
      ),
    );
  }
}

class ToolbarButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const ToolbarButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          fill: 1.0,
          color: colorScheme.onSurface
              .withValues(alpha: onTap != null ? 0.7 : 0.3),
        ),
      ),
    );
  }
}

class CustomToggleButton extends HookWidget {
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final bool? value;
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

    final selectedValue = useState<bool?>(value);

    useEffect(() {
      selectedValue.value = value;
      return null;
    }, [value]);

    void handleToggle() {
      if (onChanged == null) return;

      if (tristate) {
        if (selectedValue.value == false) {
          selectedValue.value = null;
        } else if (selectedValue.value == null) {
          selectedValue.value = true;
        } else {
          selectedValue.value = false;
        }
      } else {
        selectedValue.value = !(selectedValue.value ?? false);
      }

      final normalized =
          tristate ? selectedValue.value : selectedValue.value ?? false;
      onChanged!(normalized);
    }

    return GestureDetector(
      onTap: handleToggle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: Checkbox(
              tristate: tristate,
              value:
                  tristate ? selectedValue.value : selectedValue.value ?? false,
              onChanged: (value) {
                handleToggle();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              side: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.6),
                width: 1,
              ),
              splashRadius: 0.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity:
                  const VisualDensity(horizontal: -4.0, vertical: -4.0),
            ),
          ),
          if (child != null)
            Padding(
              padding: EdgeInsets.only(left: padding),
              child: child!,
            ),
        ],
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
