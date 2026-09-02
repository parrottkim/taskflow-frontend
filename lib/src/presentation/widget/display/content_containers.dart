part of '../widget.dart';

class ContentContainer extends StatelessWidget {
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

  const ContentContainer({
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
        foregroundDecoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: borderColor ?? colorScheme.outline.subtle,
            width: borderWidth ?? 1.0,
          ),
        ),
        child: child,
      ),
    );
  }
}

class EmptyStateView extends StatelessWidget {
  final String message;

  const EmptyStateView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/empty.svg',
            width: 40.0,
            height: 40.0,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface.strong,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(message),
        ],
      ),
    );
  }
}

class ErrorStateView extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;

  const ErrorStateView({
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
              colorScheme.onSurface.strong,
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

class ScheduleSummaryCard extends StatelessWidget {
  final Schedule schedule;

  const ScheduleSummaryCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final nights = schedule.end.difference(schedule.start).inDays;
    final days = nights + 1;

    return ContentContainer(
      padding: EdgeInsets.all(12.0),
      borderRadius: BorderRadius.circular(8.0),
      constraints: BoxConstraints(maxWidth: 430.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (schedule.end.isBefore(DateTime.now()))
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Skeleton.unite(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: colorScheme.error,
                      ),
                      child: Text(
                        formatRelativeDate(schedule.end),
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onError,
                        ),
                      ),
                    ),
                  ),
                )
              else if (schedule.start.isBefore(DateTime.now()) &&
                  schedule.end.isAfter(DateTime.now()))
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Skeleton.unite(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('report_form_schedule_in_progress'),
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Skeleton.unite(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: colorScheme.surfaceContainerHighest,
                      ),
                      child: Text(
                        Intl.message('report_form_schedule_scheduled'),
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface.muted,
                        ),
                      ),
                    ),
                  ),
                ),
              Skeleton.unite(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Functions(
                          context,
                        ).generateColorFromId(schedule.category.id),
                      ),
                    ),
                    color: Functions(
                      context,
                    ).generateColorFromId(schedule.category.id).subtle,
                  ),
                  child: Text(
                    schedule.category.name,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Functions(
                        context,
                      ).generateColorFromId(schedule.category.id),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            [
              '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.end)}',
              '$nights${Intl.message('report_form_schedule_nights')} $days${Intl.message('report_form_schedule_days')}',
            ].join(' · '),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4.0),
          Text(
            schedule.summary,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.strong,
            ),
          ),
          Text(
            schedule.description == null || schedule.description!.isEmpty
                ? Intl.message('report_form_schedule_description_empty')
                : schedule.description!,
            maxLines: 1,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.strong,
            ),
          ),
        ],
      ),
    );
  }
}
