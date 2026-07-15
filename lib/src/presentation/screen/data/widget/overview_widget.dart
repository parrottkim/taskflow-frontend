import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/supplier_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/user_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class OverviewWidget extends HookWidget {
  final String? view;

  const OverviewWidget({super.key, this.view});

  @override
  Widget build(BuildContext context) {
    final selectedItem = useState<DataSegment>(DataSegment.fromKey(view ?? ''));

    final controller = useTabController(
      initialLength: DataSegment.values.length,
      initialIndex: DataSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = DataSegment.fromKey(view ?? '');

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(DataSegment.values.indexOf(newItem));
      }

      return null;
    }, [view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = DataSegment.values[index];

            context.goNamed(
              RouteNames.data,
              queryParameters: buildQueryParameters(
                context,
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
            DataSegment.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(DataSegment.values[index].label),
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
