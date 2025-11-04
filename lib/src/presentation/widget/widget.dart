import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({super.key, this.size = 64.0});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(size / 4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 4),
        color: colorScheme.primary,
      ),
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
        colorFilter: ColorFilter.mode(
          colorScheme.onPrimary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const ContainerWidget({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.borderWidth = 1.0,
    this.constraints,
    this.width,
    this.height,
    this.elevation = 1.0,
    this.padding = const EdgeInsets.all(20.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: elevation,
      borderRadius: borderRadius,
      color: color ?? colorScheme.surfaceBright,
      clipBehavior: Clip.hardEdge,
      child: Container(
        constraints: constraints,
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: borderColor ?? colorScheme.outline.withValues(alpha: 0.2),
            width: borderWidth ?? 1.0,
          ),
        ),
        child: child,
      ),
    );
  }
}

class ErrorContainerWidget extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;

  const ErrorContainerWidget(
      {super.key, required this.error, required this.stackTrace});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/broken.svg',
            width: 40.0,
            height: 40.0,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface.withValues(alpha: 0.7),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            Intl.message('error_title'),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          if (error is DioException &&
              (error as DioException).type == DioExceptionType.connectionError)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(Intl.message('connection_error')),
            )
          else if (error is DioException &&
              (error as DioException).type ==
                  DioExceptionType.connectionTimeout)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(Intl.message('connection_timeout')),
            )
          else if (error is DioException &&
              (error as DioException).response?.data is String)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(Intl.message(
                  (error as DioException).response?.data['message'])),
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                Intl.message('error_unexpected'),
              ),
            ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => ErrorDialog(error: error, stackTrace: stackTrace),
            ),
            child: Text(
              Intl.message('error_detail'),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;
  final double avatarRadius;
  final double spacing;
  final TextStyle? usernameStyle;
  final TextStyle? emailStyle;
  final bool showEmail;
  final bool showDepartment;
  final bool showPosition;

  const UserInformation({
    super.key,
    required this.user,
    this.avatarRadius = 16.0,
    this.spacing = 8.0,
    this.usernameStyle = const TextStyle(fontWeight: FontWeight.w600),
    this.emailStyle,
    this.showEmail = true,
    this.showDepartment = false,
    this.showPosition = false,
  });

  factory UserInformation.compact({
    Key? key,
    required User user,
  }) {
    return UserInformation(
      key: key,
      user: user,
      avatarRadius: 10.0,
      spacing: 6.0,
      usernameStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      showEmail: false,
      showDepartment: false,
      showPosition: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Skeleton.unite(
          child: CircleAvatar(
            backgroundColor: Functions(context).generateColorFromId(user.id),
            radius: avatarRadius,
            child: Text(
              getInitials(user.username),
              style: TextStyle(
                fontSize: avatarRadius,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: spacing),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.username,
                  style: usernameStyle,
                ),
                if (showDepartment && user.department != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '• ${user.department!.name}',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
              ],
            ),
            if (showEmail)
              Text(
                user.email,
                style: emailStyle ??
                    textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
              ),
          ],
        ),
        if (showEmail) Spacer(),
        if (showPosition)
          Text(
            user.position != null
                ? user.position!.name
                : Intl.message('unspecified'),
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final IssueCategory item;

  const CategoryWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Skeleton.unite(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
              color: Functions(context).generateColorFromId(item.id),
            ),
          ),
          color: Functions(context)
              .generateColorFromId(item.id)
              .withValues(alpha: 0.2),
        ),
        child: Text(
          item.name,
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Functions(context).generateColorFromId(item.id),
          ),
        ),
      ),
    );
  }
}

class InvalidWidget extends HookWidget {
  final bool visible;
  final String text;

  const InvalidWidget({
    super.key,
    required this.visible,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (visible) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [visible]);

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInQuad,
      ),
      child: FadeTransition(
        opacity: opacityController,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Icon(
                Symbols.error_rounded,
                size: 16.0,
                color: colorScheme.error,
              ),
              const SizedBox(width: 4.0),
              Text(
                text,
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
