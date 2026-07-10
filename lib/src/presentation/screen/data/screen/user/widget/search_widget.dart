import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      userFilterControllerProvider(UserFilterScope.dataPage),
    );
    final dataFilter = ref.watch(dataFilterControllerProvider);

    return switch ((filter, dataFilter)) {
      (AsyncData(value: final value), AsyncData(value: final dataFilter)) =>
        _DesktopWidget(
          view: dataFilter.view,
          filter: value,
          search: value.search,
        ),
      (AsyncError(:final error, :final stackTrace), _) ||
      (
        _,
        AsyncError(:final error, :final stackTrace),
      ) => ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(child: _DesktopWidget(filter: UserFilterState())),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final String? view;
  final UserFilterState filter;
  final String? search;

  const _DesktopWidget({this.view, required this.filter, this.search});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final controller = useTextEditingController(text: search);
    final keyword = useValueListenable(controller);

    useEffect(() {
      controller.text = search ?? '';
      return null;
    }, [search]);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 430.0),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        onSubmitted: (_) {
          final search = keyword.text.trim();
          final controller = ref.read(
            userFilterControllerProvider(UserFilterScope.dataPage).notifier,
          );

          controller.setSearch(search: search);

          context.goNamed(
            RouteNames.data,
            queryParameters: {
              if (view != null) 'view': view,
              'search': search,
              if (filter.departments != null)
                'departments': filter.departments!.join(','),
              if (filter.positionId != null)
                'position_id': filter.positionId.toString(),
            },
          );
        },
        decoration: InputDecoration(
          filled: true,
          label: Text(Intl.message('project_form_user_search')),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 2.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20.0,
              height: 20.0,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface.withValues(alpha: 0.7),
                BlendMode.srcIn,
              ),
              semanticsLabel: 'Search Icon',
            ),
          ),
        ),
      ),
    );
  }
}
