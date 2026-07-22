import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ClientSelectWidget extends ConsumerWidget {
  final int? projectId;
  final List<Client>? clients;
  final ValueNotifier<bool> isClientsEmpty;

  const ClientSelectWidget({
    super.key,
    this.projectId,
    this.clients,
    required this.isClientsEmpty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(projectOptionsControllerProvider);

    return switch (options) {
      AsyncData(:final value) => _DesktopWidget(
        projectId: projectId,
        clients: clients,
        clientItems: value.clientItems,
        maxClientDepth: value.maxClientDepth,
        isClientsEmpty: isClientsEmpty,
      ),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _DesktopWidget(isClientsEmpty: isClientsEmpty),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int? projectId;
  final List<Client>? clients;
  final List<ClientGroup> clientItems;
  final int maxClientDepth;
  final ValueNotifier<bool> isClientsEmpty;

  const _DesktopWidget({
    this.projectId,
    this.clients,
    this.clientItems = const [],
    this.maxClientDepth = 0,
    required this.isClientsEmpty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allClients = clientItems.expand((group) => group.items).toList();

    List<Client> getNextLevelItems(
      List<Client> currentPath,
      List<ClientGroup> allClientGroups,
    ) {
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
              .firstWhere(
                (group) =>
                    group.depth == nextDepth &&
                    group.parentId == lastSelectedClient.id,
              )
              .items;
        } catch (e) {
          return [];
        }
      }
    }

    Client? getParentItem(
      List<Client> currentPath,
      List<ClientGroup> allClientGroups,
      Client selectedItem,
    ) {
      final index = currentPath.indexOf(selectedItem);
      if (index > 0) {
        return currentPath[index - 1];
      }
      return null;
    }

    final selectedPath = useState<List<Client>>(clients ?? []);

    return BreadcrumbDropdownButton<Client>(
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
                  color: Color(ClientType.fromKey(item.id).color),
                ),
                child: SizedBox(
                  width: 12.0,
                  height: 12.0,
                  child: SvgPicture.asset(
                    ClientType.fromKey(item.id).asset,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
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
        selectedPath.value = newPath;

        final nextLevelItems = getNextLevelItems(newPath, clientItems);
        final hasNoChildren = nextLevelItems.isEmpty;

        final isComplete = newPath.length == maxClientDepth || hasNoChildren;

        ref
            .read(projectFormControllerProvider(projectId: projectId).notifier)
            .setClients(clients: newPath, isAllClientSelected: isComplete);

        isClientsEmpty.value = !isComplete ? isClientsEmpty.value : false;
      },
    );
  }
}
