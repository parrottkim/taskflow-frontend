import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/supplier_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/user_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class OverviewWidget extends HookConsumerWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(dataFilterControllerProvider);
    final selectedItem = useState<AdminDataSection>(
      AdminDataSection.fromKey(filter.view ?? ''),
    );

    final controller = useTabController(
      initialLength: AdminDataSection.values.length,
      initialIndex: AdminDataSection.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = AdminDataSection.fromKey(filter.view ?? '');

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(AdminDataSection.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = AdminDataSection.values[index];

            ref
                .read(dataFilterControllerProvider.notifier)
                .setView(view: selectedItem.value.name);

            context.goNamed(
              RouteNames.data,
              queryParameters: context.buildQueryParameters(
                updates: {
                  'view': selectedItem.value.name,
                  'search': null,
                  'departments': null,
                  'position_id': null,
                },
              ),
            );
          },
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: List.generate(
            AdminDataSection.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(AdminDataSection.values[index].label),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [UserWidget(), SupplierWidget()],
          ),
        ),
      ],
    );
  }
}
