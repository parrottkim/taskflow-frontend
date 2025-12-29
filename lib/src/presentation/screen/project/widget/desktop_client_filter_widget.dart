import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class DesktopClientFilterWidget extends ConsumerWidget {
  const DesktopClientFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) =>
        _DesktopWidget(clients: value.clients, items: value.clientItems),
      _ => Skeletonizer(
          ignoreContainers: true,
          child: _DesktopWidget(
            items: [],
          ),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<int>? clients;
  final List<ClientGroup> items;

  const _DesktopWidget({
    this.clients,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allClients = items.expand((group) => group.items).toList();

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
        final nextDepth = currentPath.length; // Depth of the next level
        try {
          return allClientGroups
              .firstWhere((group) =>
                  group.depth == nextDepth &&
                  group.parentId == lastSelectedClient.id)
              .items;
        } catch (e) {
          return []; // No next level items
        }
      }
    }

    Client? getParentItem(List<Client> currentPath,
        List<ClientGroup> allClientGroups, Client selectedItem) {
      final index = currentPath.indexOf(selectedItem);
      if (index > 0) {
        return currentPath[index - 1]; // Return the previous item in the path
      }
      return null; // No parent in the path (it's the first item or not in path)
    }

    final selectedPath = useState<List<Client>>(
      clients
              ?.map((id) => allClients.firstWhere((item) => item.id == id))
              .toList() ??
          [],
    );

    useEffect(() {
      selectedPath.value = clients
              ?.map((id) => allClients.firstWhere((item) => item.id == id))
              .toList() ??
          [];
      return null;
    }, [clients]);

    return BreadcrumbDropdownButton<Client>(
      items: allClients,
      selectedPath: selectedPath,
      label: Intl.message('project_filter_1'),
      icon: const Icon(Symbols.factory_rounded),
      itemBuilder: (item) {
        final itemDepth = items
            .firstWhere((group) => group.items.any((c) => c.id == item.id))
            .depth;

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
      getNextLevelItems: (currentPath, allItems) => getNextLevelItems(
          currentPath, items), // Pass items (ClientGroup list)
      getParentItem: (currentPath, allItems, selectedItem) => getParentItem(
          currentPath, items, selectedItem), // Pass items (ClientGroup list)
      onChanged: (newPath) {
        ref.read(projectFilterControllerProvider.notifier).setClients(
            clients:
                newPath.isEmpty ? null : newPath.map((e) => e.id).toList());

        final queryParameters = ref
            .read(projectFilterControllerProvider.notifier)
            .toQueryParameters();

        context.goNamed(RouteNames.project, queryParameters: queryParameters);
      },
    );
  }
}
