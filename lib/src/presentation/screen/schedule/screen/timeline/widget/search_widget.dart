import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/router/router.dart';

class SearchWidget extends HookConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      scheduleFilterControllerProvider(ScheduleFilterScope.schedulePage),
    );
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
          final search = keyword.text.trim();
          final controller = ref.read(
            scheduleFilterControllerProvider(
              ScheduleFilterScope.schedulePage,
            ).notifier,
          );

          controller.setSearch(search: search.isEmpty ? null : search);

          context.goNamed(
            RouteNames.schedule,
            queryParameters: context.buildQueryParameters(
              updates: {'search': search},
            ),
          );
        },
        decoration: InputDecoration(
          filled: true,
          label: Text(Intl.message('schedule_search')),
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
