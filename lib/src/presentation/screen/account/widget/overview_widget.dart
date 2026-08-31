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
    final filter = ref.watch(accountFilterControllerProvider);
    final selectedItem = useState<AccountSection>(
      AccountSection.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => AccountSection.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: AccountSection.values.length,
      initialIndex: AccountSection.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = AccountSection.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => AccountSection.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(AccountSection.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = AccountSection.values[index];

            ref
                .read(accountFilterControllerProvider.notifier)
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
            AccountSection.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(AccountSection.values[index].label),
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
