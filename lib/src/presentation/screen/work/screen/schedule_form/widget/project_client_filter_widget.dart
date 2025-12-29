import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProjectClientFilterWidget extends HookConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final List<ClientGroup> clientItems;

  const ProjectClientFilterWidget({
    super.key,
    required this.categoryId,
    this.scheduleId,
    required this.clientItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allClients = clientItems.expand((group) => group.items).toList();

    List<Client> getNextLevelItems(
        List<Client> currentPath, List<ClientGroup> allClientGroups) {
      if (allClientGroups.isEmpty) {
        return [];
      }
      if (currentPath.isEmpty) {
        try {
          return allClientGroups
              .firstWhere((group) => group.depth == 0 && group.parentId == null)
              .items;
        } catch (e) {
          return [];
        }
      } else {
        final lastSelectedClient = currentPath.last;
        final nextDepth = currentPath.length;
        try {
          return allClientGroups
              .firstWhere((group) =>
                  group.depth == nextDepth &&
                  group.parentId == lastSelectedClient.id)
              .items;
        } catch (e) {
          return [];
        }
      }
    }

    Client? getParentItem(List<Client> currentPath,
        List<ClientGroup> allClientGroups, Client selectedItem) {
      final index = currentPath.indexOf(selectedItem);
      if (index > 0) {
        return currentPath[index - 1];
      }
      return null;
    }

    final selectedPath = useState<List<Client>>([]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: BreadcrumbDropdownButton<Client>(
        items: allClients,
        selectedPath: selectedPath,
        label: Intl.message('project_form_clients_select'),
        icon: const Icon(Symbols.factory_rounded),
        itemBuilder: (item) {
          int? itemDepth;
          for (var group in clientItems) {
            if (group.items.any((client) => client.id == item.id)) {
              itemDepth = group.depth;
              break;
            }
          }

          return Row(
            children: [
              if (itemDepth == 0)
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Color(
                      ClientType.values
                          .singleWhere((client) => client.id == item.id)
                          .color,
                    ),
                  ),
                  child: SizedBox(
                    width: 12.0,
                    height: 12.0,
                    child: SvgPicture.asset(
                      ClientType.values
                          .singleWhere((client) => client.id == item.id)
                          .asset,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
              Text(item.name),
            ],
          );
        },
        getNextLevelItems: (currentPath, allItems) =>
            getNextLevelItems(currentPath, clientItems),
        getParentItem: (currentPath, allItems, selectedItem) =>
            getParentItem(currentPath, clientItems, selectedItem),
        onChanged: (newPath) {
          ref.read(projectFilterControllerProvider.notifier).setClients(
              clients:
                  newPath.isEmpty ? null : newPath.map((e) => e.id).toList());
        },
      ),
    );
  }
}
