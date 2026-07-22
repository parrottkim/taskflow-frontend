part of '../widget.dart';

class NavigationSearchDialog extends HookConsumerWidget {
  const NavigationSearchDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final auth = ref.watch(authControllerProvider);
    final local = ref.watch(localControllerProvider);

    final controller = useTextEditingController();
    final keyword = useValueListenable(controller);
    final search = keyword.text.trim().isEmpty
        ? null
        : ref.watch(navigationSearchControllerProvider);

    void setSearchText(String value) {
      controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
        composing: TextRange.empty,
      );
    }

    final isAdmin = auth is AuthAuthenticated && auth.user.isAdmin;
    final menus = WidgetPreset(
      context,
    ).navigationItems.whereType<NavigationButton>();
    final filteredMenus = menus.where((item) {
      if (!item.isAdmin || isAdmin) {
        if (keyword.text.isEmpty) return true;
        return item.label.toLowerCase().contains(keyword.text.toLowerCase()) ||
            item.route.toLowerCase().contains(keyword.text.toLowerCase());
      }
      return false;
    }).toList();

    void moveToMenu(NavigationButton item) {
      final router = GoRouter.of(context);

      ref.read(localControllerProvider.notifier).addKeywords(text: item.label);
      context.pop();
      router.goNamed(item.route);
    }

    void moveToProject(ProjectListItem project) {
      final router = GoRouter.of(context);

      ref
          .read(localControllerProvider.notifier)
          .addKeywords(text: keyword.text);
      context.pop();
      router.goNamed(
        RouteNames.projectDetail,
        pathParameters: {'project_id': project.id.toString()},
      );
    }

    void moveToProjectSearch(String value) {
      final nextSearch = value.trim();
      if (nextSearch.isEmpty) return;

      final router = GoRouter.of(context);

      ref.read(localControllerProvider.notifier).addKeywords(text: nextSearch);
      context.pop();
      router.goNamed(
        RouteNames.project,
        queryParameters: {'search': nextSearch},
      );
    }

    void submitSearch() {
      final nextSearch = keyword.text.trim();
      if (nextSearch.isEmpty) return;

      if (filteredMenus.isNotEmpty) {
        moveToMenu(filteredMenus.first);
        return;
      }

      switch (search) {
        case AsyncData(:final value) when value.projects.isNotEmpty:
          moveToProject(value.projects.first);
        default:
          moveToProjectSearch(nextSearch);
      }
    }

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: const BoxConstraints(maxWidth: 600.0, maxHeight: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => submitSearch(),
              onChanged: (value) => ref
                  .read(navigationFilterControllerProvider.notifier)
                  .debounceSearch(search: value),
              decoration: InputDecoration(
                hintText: Intl.message('navigation_search_title'),
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
                suffixIcon: IconButton(
                  tooltip: keyword.text.isEmpty
                      ? Intl.message('common_close')
                      : Intl.message('common_cancel'),
                  onPressed: keyword.text.isEmpty
                      ? () => context.pop()
                      : () {
                          setSearchText('');
                          ref
                              .read(navigationFilterControllerProvider.notifier)
                              .setSearch(search: '');
                        },
                  icon: Icon(
                    keyword.text.isEmpty
                        ? Symbols.close_rounded
                        : Symbols.cancel_rounded,
                    size: 20.0,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 420.0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 120),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeOut,
                child: keyword.text.isEmpty
                    ? _SearchIdleContent(
                        key: const ValueKey('idle'),
                        local: local,
                        navigationItems: filteredMenus,
                        onKeywordTap: (value) {
                          setSearchText(value);
                          ref
                              .read(navigationFilterControllerProvider.notifier)
                              .setSearch(search: value);
                        },
                        onKeywordRemove: () => ref
                            .read(localControllerProvider.notifier)
                            .removeKeywords(),
                        onMenuTap: moveToMenu,
                      )
                    : _SearchActiveContent(
                        key: const ValueKey('active'),
                        keyword: keyword.text,
                        projectSearch: search!,
                        menuResults: filteredMenus,
                        onMenuTap: moveToMenu,
                        onProjectTap: moveToProject,
                        onSearchTap: moveToProjectSearch,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchIdleContent extends StatelessWidget {
  final AsyncValue<LocalState> local;
  final List<NavigationButton> navigationItems;
  final ValueChanged<String> onKeywordTap;
  final VoidCallback onKeywordRemove;
  final ValueChanged<NavigationButton> onMenuTap;

  const _SearchIdleContent({
    super.key,
    required this.local,
    required this.navigationItems,
    required this.onKeywordTap,
    required this.onKeywordRemove,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      children: [
        _SearchSectionHeader(
          title: Intl.message('navigation_search_keyword'),
          action: switch (local) {
            AsyncData(:final value) when value.keywords.isNotEmpty =>
              CustomTextButton(
                onPressed: onKeywordRemove,
                text: Intl.message('navigation_search_keyword_erase'),
              ),
            _ => null,
          },
        ),
        ...switch (local) {
          AsyncData(:final value) =>
            value.keywords.isNotEmpty
                ? value.keywords
                      .map(
                        (keyword) => _SearchTile(
                          icon: Symbols.history_rounded,
                          title: keyword.keyword,
                          onTap: () => onKeywordTap(keyword.keyword),
                        ),
                      )
                      .toList()
                : [
                    _SearchEmptyText(
                      text: Intl.message('navigation_search_keyword_empty'),
                    ),
                  ],
          _ => [
            Skeletonizer(
              child: Column(
                children: List.generate(
                  3,
                  (_) => _SearchTile(
                    icon: Symbols.history_rounded,
                    title: '최근 검색어',
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        },
        const SizedBox(height: 12.0),
        _SearchSectionHeader(title: Intl.message('navigation_search_menu')),
        ...navigationItems.map(
          (item) => _SearchTile(
            icon: item.icon,
            title: item.label,
            onTap: () => onMenuTap(item),
          ),
        ),
      ],
    );
  }
}

class _SearchActiveContent extends StatelessWidget {
  final String keyword;
  final AsyncValue<NavigationSearchState> projectSearch;
  final List<NavigationButton> menuResults;
  final ValueChanged<NavigationButton> onMenuTap;
  final ValueChanged<ProjectListItem> onProjectTap;
  final ValueChanged<String> onSearchTap;

  const _SearchActiveContent({
    super.key,
    required this.keyword,
    required this.projectSearch,
    required this.menuResults,
    required this.onMenuTap,
    required this.onProjectTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      children: [
        if (menuResults.isNotEmpty) ...[
          _SearchSectionHeader(title: Intl.message('navigation_search_menu')),
          ...menuResults.map(
            (item) => _SearchTile(
              icon: item.icon,
              title: item.label,
              onTap: () => onMenuTap(item),
            ),
          ),
          const SizedBox(height: 12.0),
        ],
        switch (projectSearch) {
          AsyncData(:final value) => _SearchProjectSection(
            keyword: keyword,
            projectResults: value.projects,
            onProjectTap: onProjectTap,
            onSearchTap: onSearchTap,
          ),
          AsyncError(:final error, :final stackTrace) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ErrorContainerWidget(error: error, stackTrace: stackTrace),
          ),
          _ => Skeletonizer(
            child: _SearchProjectSection(
              keyword: keyword,
              projectResults: List.filled(3, ProjectListItem.dummy()),
              onProjectTap: (_) {},
              onSearchTap: (_) {},
            ),
          ),
        },
      ],
    );
  }
}

class _SearchProjectSection extends StatelessWidget {
  final String keyword;
  final List<ProjectListItem> projectResults;
  final ValueChanged<ProjectListItem> onProjectTap;
  final ValueChanged<String> onSearchTap;

  const _SearchProjectSection({
    required this.keyword,
    required this.projectResults,
    required this.onProjectTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchSectionHeader(title: Intl.message('project')),
        if (projectResults.isNotEmpty)
          ...projectResults.map(
            (project) => _SearchTile(
              icon: Symbols.work_rounded,
              title: project.name,
              subtitle: project.code,
              onTap: () => onProjectTap(project),
            ),
          ),
        _SearchTile(
          icon: Symbols.search_rounded,
          title: Intl.message('navigation_search_project_all'),
          subtitle: keyword,
          onTap: () => onSearchTap(keyword),
        ),
        if (projectResults.isEmpty)
          _SearchEmptyText(
            text: Intl.message('navigation_search_result_empty'),
          ),
      ],
    );
  }
}

class _SearchSectionHeader extends StatelessWidget {
  final String title;
  final Widget? action;

  const _SearchSectionHeader({required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          ?action,
        ],
      ),
    );
  }
}

class _SearchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _SearchTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.0,
              color: colorScheme.outline.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium,
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.55),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchEmptyText extends StatelessWidget {
  final String text;

  const _SearchEmptyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(text),
    );
  }
}
