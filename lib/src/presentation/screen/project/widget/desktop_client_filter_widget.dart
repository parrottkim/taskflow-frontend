import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';
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
    final filter = ref.watch(
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );
    final options = ref.watch(projectOptionsControllerProvider);

    return switch ((filter, options)) {
      (AsyncData(value: final filter), AsyncData(value: final options)) =>
        _DesktopWidget(
          filter: filter,
          clients: filter.clients,
          items: options.clientItems,
        ),
      (AsyncError(:final error, :final stackTrace), _) ||
      (
        _,
        AsyncError(:final error, :final stackTrace),
      ) => ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _DesktopWidget(filter: ProjectFilterState(), items: []),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final ProjectFilterState filter;
  final List<int>? clients;
  final List<ClientGroup> items;

  const _DesktopWidget({
    required this.filter,
    this.clients,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allClients = items.expand((group) => group.items).toList();

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
        final nextDepth = currentPath.length; // Depth of the next level
        try {
          return allClientGroups
              .firstWhere(
                (group) =>
                    group.depth == nextDepth &&
                    group.parentId == lastSelectedClient.id,
              )
              .items;
        } catch (e) {
          return []; // No next level items
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
        return currentPath[index - 1]; // Return the previous item in the path
      }
      return null; // No parent in the path (it's the first item or not in path)
    }

    List<Client> getSelectedPath(List<int>? clients) {
      if (clients == null || clients.isEmpty) return [];

      return clients
          .map((id) => allClients.firstWhereOrNull((item) => item.id == id))
          .nonNulls
          .toList();
    }

    final selectedPath = useState<List<Client>>(getSelectedPath(clients));

    useEffect(() {
      selectedPath.value = getSelectedPath(clients);
      return null;
    }, [clients, items]);

    return BreadcrumbDropdownButton<Client>(
      items: allClients,
      selectedPath: selectedPath,
      label: Intl.message('project_filter_1'),
      icon: const Icon(Symbols.factory_rounded),
      itemBuilder: (item) {
        final itemDepth = items
            .firstWhereOrNull(
              (group) => group.items.any((c) => c.id == item.id),
            )
            ?.depth;

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
      getNextLevelItems: (currentPath, allItems) => getNextLevelItems(
        currentPath,
        items,
      ), // Pass items (ClientGroup list)
      getParentItem: (currentPath, allItems, selectedItem) => getParentItem(
        currentPath,
        items,
        selectedItem,
      ), // Pass items (ClientGroup list)
      onChanged: (newPath) {
        final nextClients = newPath.isEmpty
            ? null
            : newPath.map((e) => e.id).toList();

        ref
            .read(
              projectFilterControllerProvider(
                ProjectFilterScope.projectPage,
              ).notifier,
            )
            .setClients(clients: nextClients);

        context.goNamed(
          RouteNames.project,
          queryParameters: {
            if (filter.view != null) 'view': filter.view,
            if (filter.sort != null) 'sort': filter.sort?.key,
            if (filter.order != null) 'order': filter.order?.key,
            if (filter.search != null) 'search': filter.search,
            if (filter.bookmark != null) 'bookmark': filter.bookmark.toString(),
            if (nextClients != null) 'clients': nextClients.join(','),
            if (filter.categories != null)
              'categories': filter.categories?.join(','),
          },
        );
      },
    );
  }
}
