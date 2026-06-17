part of 'widget.dart';

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
    this.elevation = 0.0,
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

  const ErrorContainerWidget({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // build 메서드 내부에서 변수로 처리
    final String errorMessage = switch (error) {
      DioException e when e.type == DioExceptionType.connectionError =>
        Intl.message('connection_error'),
      DioException e when e.type == DioExceptionType.connectionTimeout =>
        Intl.message('connection_timeout'),
      DioException e when e.response?.data is Map =>
        switch (e.response?.data['message']) {
          String msg => Intl.message(msg),
          List msgList => msgList.join('\n'),
          _ => Intl.message('error_unexpected'),
        },
      _ => Intl.message('error_unexpected'),
    };

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
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(errorMessage), // 변환된 메시지 사용
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => ErrorDialog(error: error, stackTrace: stackTrace),
            ),
            child: Text(Intl.message('error_detail')),
          ),
        ],
      ),
    );
  }
}
