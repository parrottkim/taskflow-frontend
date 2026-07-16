import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/account/screen/user/user_screen.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class OverviewWidget extends HookConsumerWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(dataFilterControllerProvider);
    final selectedItem = useState<AccountSegment>(
      AccountSegment.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => AccountSegment.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: AccountSegment.values.length,
      initialIndex: AccountSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = AccountSegment.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => AccountSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(AccountSegment.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = AccountSegment.values[index];

            ref
                .read(dataFilterControllerProvider.notifier)
                .setView(view: selectedItem.value.name);

            context.goNamed(
              RouteNames.account,
              queryParameters: context.buildQueryParameters(
                updates: {'view': selectedItem.value.name},
              ),
            );

            controller.animateTo(index);
          },
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: List.generate(
            AccountSegment.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(AccountSegment.values[index].label),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(controller: controller, children: [UserScreen()]),
        ),
      ],
    );
  }
}
