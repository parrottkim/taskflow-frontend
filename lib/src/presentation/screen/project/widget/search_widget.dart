import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/router/router.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(filter: value),
      _ => Skeletonizer.zone(
        child: _DesktopWidget(filter: ProjectFilterState()),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final ProjectFilterState filter;

  const _DesktopWidget({required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final controller = useTextEditingController(text: filter.search);
    final keyword = useValueListenable(controller);

    useEffect(() {
      controller.text = filter.search ?? '';
      return null;
    }, [filter.search]);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 430.0),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        onSubmitted: (_) {
          final nextSearch = keyword.text.trim().isEmpty
              ? null
              : keyword.text.trim();

          ref
              .read(
                projectFilterControllerProvider(
                  ProjectFilterScope.projectPage,
                ).notifier,
              )
              .setSearch(search: nextSearch);

          context.goNamed(
            RouteNames.project,
            queryParameters: {
              if (filter.view != null) 'view': filter.view,
              if (filter.sort != null) 'sort': filter.sort?.key,
              if (filter.order != null) 'order': filter.order?.key,
              'search': ?nextSearch,
              if (filter.bookmark != null)
                'bookmark': filter.bookmark.toString(),
              if (filter.clients != null) 'clients': filter.clients?.join(','),
              if (filter.categories != null)
                'categories': filter.categories?.join(','),
            },
          );
        },
        decoration: InputDecoration(
          filled: true,
          label: Text(Intl.message('project_search')),
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
