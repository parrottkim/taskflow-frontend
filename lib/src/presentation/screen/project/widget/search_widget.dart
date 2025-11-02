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
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          search: value.search,
        ),
      _ => Skeletonizer.zone(
          child: _DesktopWidget(),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final String? search;

  const _DesktopWidget({this.search});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final controller = useTextEditingController(text: search);
    final text = useListenableSelector(controller, () => controller.text);

    useEffect(() {
      if (search != null) {
        controller.text = search!;
      }
      return null;
    }, [search]);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 430.0),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        onSubmitted: (value) {
          if (text.isNotEmpty) {
            ref
                .read(projectFilterControllerProvider.notifier)
                .setSearch(search: text);
          }

          final queryParameters = ref
              .read(projectFilterControllerProvider.notifier)
              .toQueryParameters();

          context.goNamed(RouteNames.project, queryParameters: queryParameters);
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
