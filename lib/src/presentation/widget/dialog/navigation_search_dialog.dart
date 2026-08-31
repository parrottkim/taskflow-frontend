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
    final scrollController = useScrollController();
    final selectedIndex = useState(0);
    final itemKeys = useMemoized(() => <String, GlobalKey>{});
    final searchText = keyword.text.trim();
    final navigationFilter = ref.watch(navigationFilterControllerProvider);
    final isSearchReady =
        searchText.isNotEmpty && navigationFilter.search == searchText;
    final search = isSearchReady
        ? ref.watch(navigationSearchProvider)
        : const AsyncLoading<DashboardSearchResult>();
    final router = GoRouter.of(context);

    void setSearchText(String value) {
      controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
        composing: TextRange.empty,
      );
    }

    void closeAndGoNamed(
      String name, {
      Map<String, String> pathParameters = const {},
      Map<String, String> queryParameters = const {},
      bool push = false,
    }) {
      context.pop();
      if (push) {
        router.pushNamed(
          name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
        );
      } else {
        router.goNamed(
          name,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
        );
      }
    }

    void saveSearchKeyword() {
      if (searchText.isNotEmpty) {
        ref
            .read(localControllerProvider.notifier)
            .addKeywords(text: searchText);
      }
    }

    void moveToProjectSearch(String value) {
      final nextSearch = value.trim();
      if (nextSearch.isEmpty) return;
      ref.read(localControllerProvider.notifier).addKeywords(text: nextSearch);
      closeAndGoNamed(
        RouteNames.project,
        queryParameters: {'search': nextSearch},
      );
    }

    void moveToResult(DashboardSearchItem item) {
      saveSearchKeyword();
      switch (item.type) {
        case DashboardSearchItemType.project:
          closeAndGoNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': item.id.toString()},
          );
        case DashboardSearchItemType.document:
          closeAndGoNamed(
            RouteNames.documentDetail,
            pathParameters: {'document_id': item.id.toString()},
          );
        case DashboardSearchItemType.schedule:
          closeAndGoNamed(
            RouteNames.scheduleEdit,
            pathParameters: {'schedule_id': item.id.toString()},
          );
        case DashboardSearchItemType.issue:
          final projectId = item.projectId;
          if (projectId == null) return;
          closeAndGoNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
            queryParameters: {'issue': item.id.toString()},
          );
        case DashboardSearchItemType.report:
          final projectId = item.projectId;
          if (projectId == null) return;
          closeAndGoNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
            queryParameters: {'report': item.id.toString()},
          );
      }
    }

    bool matches(String title, List<String> aliases) {
      if (searchText.isEmpty) return true;
      final query = searchText.toLowerCase();
      return title.toLowerCase().contains(query) ||
          aliases.any((value) => value.toLowerCase().contains(query));
    }

    final hasActionIntent = const [
      '새',
      '등록',
      '작성',
      '생성',
    ].any(searchText.contains);
    final allQuickActions = [
      _SearchEntry(
        id: 'action-project-new',
        icon: Symbols.add_business_rounded,
        title: Intl.message('dashboard_functions_2'),
        keywords: const ['프로젝트', '새 프로젝트', '등록', '생성'],
        onTap: () => closeAndGoNamed(RouteNames.projectNew, push: true),
      ),
      _SearchEntry(
        id: 'action-schedule-new',
        icon: Symbols.event_upcoming_rounded,
        title: Intl.message('dashboard_functions_1'),
        keywords: const ['일정', '근무 일정', '등록', '생성'],
        onTap: () => closeAndGoNamed(RouteNames.scheduleNewChoose, push: true),
      ),
      _SearchEntry(
        id: 'action-document-new',
        icon: Symbols.note_add_rounded,
        title: '${Intl.message('document')} ${Intl.message('common_post')}',
        keywords: const ['문서', '새 문서', '작성', '등록', '생성'],
        onTap: () => closeAndGoNamed(RouteNames.documentNew, push: true),
      ),
    ];
    final quickActions = allQuickActions.where((item) {
      return hasActionIntent && matches(item.title, item.keywords);
    }).toList();

    final isAdmin = auth is AuthAuthenticated && auth.user.isAdmin;
    final menuEntries = [
      ...UiConfiguration(context).navigationItems
          .whereType<NavigationButton>()
          .where((item) => !item.isAdmin || isAdmin)
          .where((item) => matches(item.label, [item.route]))
          .map(
            (item) => _SearchEntry(
              id: 'menu-${item.route}',
              icon: item.icon,
              title: item.label,
              keywords: [item.route],
              onTap: () => closeAndGoNamed(item.route),
            ),
          ),
      if (matches(Intl.message('account'), const ['계정', '내 정보', '프로필']))
        _SearchEntry(
          id: 'menu-account',
          icon: Symbols.account_circle_rounded,
          title: Intl.message('account'),
          keywords: const ['계정', '내 정보', '프로필'],
          onTap: () => closeAndGoNamed(RouteNames.account),
        ),
    ];

    List<_SearchEntry> resultEntries(
      DashboardSearchGroup group,
      IconData icon,
    ) => group.items
        .map(
          (item) => _SearchEntry(
            id: 'result-${item.type.name}-${item.id}',
            icon: icon,
            title: item.title,
            subtitle: switch (item.type) {
              DashboardSearchItemType.schedule when item.start != null =>
                '${item.subtitle ?? ''} · ${DateFormat('yyyy.MM.dd').format(item.start!)}',
              _ => item.subtitle,
            },
            onTap: () => moveToResult(item),
          ),
        )
        .toList();

    final sections = <_SearchSectionData>[];
    var showLoading = false;
    var showEmpty = false;
    Object? searchError;
    StackTrace? searchStackTrace;

    if (searchText.isEmpty) {
      switch (local) {
        case AsyncData(:final value) when value.keywords.isNotEmpty:
          sections.add(
            _SearchSectionData(
              title: Intl.message('navigation_search_keyword'),
              action: AppTextButton(
                onPressed: () =>
                    ref.read(localControllerProvider.notifier).removeKeywords(),
                text: Intl.message('navigation_search_keyword_erase'),
              ),
              entries: value.keywords
                  .map(
                    (item) => _SearchEntry(
                      id: 'history-${item.keyword}',
                      icon: Symbols.history_rounded,
                      title: item.keyword,
                      onTap: () {
                        selectedIndex.value = 0;
                        setSearchText(item.keyword);
                        ref
                            .read(navigationFilterControllerProvider.notifier)
                            .setSearch(search: item.keyword);
                      },
                    ),
                  )
                  .toList(),
            ),
          );
        case AsyncLoading():
          showLoading = true;
        default:
          break;
      }
      sections.add(
        _SearchSectionData(
          title: Intl.message('common_post'),
          entries: allQuickActions,
        ),
      );
      if (menuEntries.isNotEmpty) {
        sections.add(
          _SearchSectionData(
            title: Intl.message('navigation_search_menu'),
            entries: menuEntries,
          ),
        );
      }
    } else {
      if (quickActions.isNotEmpty) {
        sections.add(
          _SearchSectionData(
            title: Intl.message('common_post'),
            entries: quickActions,
          ),
        );
      }
      if (menuEntries.isNotEmpty) {
        sections.add(
          _SearchSectionData(
            title: Intl.message('navigation_search_menu'),
            entries: menuEntries,
          ),
        );
      }

      switch (search) {
        case AsyncData(:final value):
          final projectEntries =
              resultEntries(value.projects, Symbols.work_rounded)..add(
                _SearchEntry(
                  id: 'result-project-all',
                  icon: Symbols.search_rounded,
                  title: Intl.message('navigation_search_project_all'),
                  subtitle: searchText,
                  onTap: () => moveToProjectSearch(searchText),
                ),
              );
          sections.add(
            _SearchSectionData(
              title: Intl.message('project'),
              entries: projectEntries,
            ),
          );
          final resultGroups = [
            (
              title: Intl.message('document'),
              entries: resultEntries(
                value.documents,
                Symbols.description_rounded,
              ),
            ),
            (
              title: Intl.message('schedule'),
              entries: resultEntries(
                value.schedules,
                Symbols.calendar_month_rounded,
              ),
            ),
            (
              title: Intl.message('work_segment_2'),
              entries: resultEntries(value.issues, Symbols.task_rounded),
            ),
            (
              title: Intl.message('work_segment_3'),
              entries: resultEntries(value.reports, Symbols.summarize_rounded),
            ),
          ];
          for (final group in resultGroups) {
            if (group.entries.isNotEmpty) {
              sections.add(
                _SearchSectionData(title: group.title, entries: group.entries),
              );
            }
          }
          showEmpty =
              value.projects.items.isEmpty &&
              value.documents.items.isEmpty &&
              value.schedules.items.isEmpty &&
              value.issues.items.isEmpty &&
              value.reports.items.isEmpty;
        case AsyncError(:final error, :final stackTrace):
          searchError = error;
          searchStackTrace = stackTrace;
        default:
          showLoading = true;
      }
    }

    final selectableEntries = [
      for (final section in sections) ...section.entries,
    ];
    final effectiveSelectedIndex = selectableEntries.isEmpty
        ? -1
        : selectedIndex.value.clamp(0, selectableEntries.length - 1);

    void ensureSelectionVisible(int index) {
      final key = itemKeys[selectableEntries[index].id];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final itemContext = key?.currentContext;
        if (itemContext != null) {
          Scrollable.ensureVisible(
            itemContext,
            duration: const Duration(milliseconds: 120),
            alignment: 0.5,
          );
        }
      });
    }

    void moveSelection(int offset) {
      if (selectableEntries.isEmpty) return;
      final current = effectiveSelectedIndex < 0 ? 0 : effectiveSelectedIndex;
      final next = (current + offset).clamp(0, selectableEntries.length - 1);
      selectedIndex.value = next;
      ensureSelectionVisible(next);
    }

    void executeSelection() {
      if (effectiveSelectedIndex >= 0) {
        selectableEntries[effectiveSelectedIndex].onTap();
      } else if (searchText.isNotEmpty) {
        moveToProjectSearch(searchText);
      }
    }

    KeyEventResult handleKeyEvent(FocusNode _, KeyEvent event) {
      if (event is! KeyDownEvent) return KeyEventResult.ignored;
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          moveSelection(1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowUp:
          moveSelection(-1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.escape:
          context.pop();
          return KeyEventResult.handled;
        default:
          return KeyEventResult.ignored;
      }
    }

    return Focus(
      onKeyEvent: handleKeyEvent,
      child: Dialog(
        child: ContentContainer(
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
                onSubmitted: (_) => executeSelection(),
                onChanged: (value) {
                  selectedIndex.value = 0;
                  ref
                      .read(navigationFilterControllerProvider.notifier)
                      .debounceSearch(search: value.trim());
                },
                decoration: InputDecoration(
                  hintText: Intl.message('navigation_search_title'),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 13.0, right: 2.0),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 20.0,
                      height: 20.0,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurface.strong,
                        BlendMode.srcIn,
                      ),
                      semanticsLabel: 'Search Icon',
                    ),
                  ),
                  suffixIcon: searchText.isNotEmpty
                      ? IconButton(
                          tooltip: searchText.isEmpty
                              ? Intl.message('common_close')
                              : Intl.message('common_cancel'),
                          onPressed: searchText.isEmpty
                              ? () => context.pop()
                              : () {
                                  selectedIndex.value = 0;
                                  setSearchText('');
                                  ref
                                      .read(
                                        navigationFilterControllerProvider
                                            .notifier,
                                      )
                                      .setSearch(search: '');
                                },
                          icon: Icon(
                            Symbols.close_rounded,
                            size: 20.0,
                            color: colorScheme.onSurface.strong,
                          ),
                        )
                      : null,
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
                child: _SearchContent(
                  scrollController: scrollController,
                  sections: sections,
                  selectedIndex: effectiveSelectedIndex,
                  itemKey: (entry) =>
                      itemKeys.putIfAbsent(entry.id, () => GlobalKey()),
                  onHover: (index) => selectedIndex.value = index,
                  showLoading: showLoading,
                  showEmpty: showEmpty,
                  error: searchError,
                  stackTrace: searchStackTrace,
                ),
              ),
              const _SearchKeyboardHint(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchEntry {
  final String id;
  final IconData icon;
  final String title;
  final String? subtitle;
  final List<String> keywords;
  final VoidCallback onTap;

  const _SearchEntry({
    required this.id,
    required this.icon,
    required this.title,
    this.subtitle,
    this.keywords = const [],
    required this.onTap,
  });
}

class _SearchSectionData {
  final String title;
  final List<_SearchEntry> entries;
  final Widget? action;

  const _SearchSectionData({
    required this.title,
    required this.entries,
    this.action,
  });
}

class _SearchContent extends StatelessWidget {
  final ScrollController scrollController;
  final List<_SearchSectionData> sections;
  final int selectedIndex;
  final GlobalKey Function(_SearchEntry entry) itemKey;
  final ValueChanged<int> onHover;
  final bool showLoading;
  final bool showEmpty;
  final Object? error;
  final StackTrace? stackTrace;

  const _SearchContent({
    required this.scrollController,
    required this.sections,
    required this.selectedIndex,
    required this.itemKey,
    required this.onHover,
    required this.showLoading,
    required this.showEmpty,
    this.error,
    this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    var index = 0;
    final widgets = <Widget>[];
    for (final section in sections) {
      widgets.add(
        _SearchSectionHeader(title: section.title, action: section.action),
      );
      for (final entry in section.entries) {
        final entryIndex = index++;
        widgets.add(
          _SearchTile(
            key: itemKey(entry),
            icon: entry.icon,
            title: entry.title,
            subtitle: entry.subtitle,
            selected: entryIndex == selectedIndex,
            onHover: () => onHover(entryIndex),
            onTap: entry.onTap,
          ),
        );
      }
      widgets.add(const SizedBox(height: 12.0));
    }

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      children: [
        ...widgets,
        if (showLoading)
          Skeletonizer(
            child: Column(
              children: List.generate(
                3,
                (_) => _SearchTile(
                  icon: Symbols.search_rounded,
                  title: '검색 결과',
                  onTap: () {},
                ),
              ),
            ),
          ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ErrorStateView(
              error: error!,
              stackTrace: stackTrace ?? StackTrace.empty,
            ),
          ),
        if (showEmpty)
          _SearchEmptyText(
            text: Intl.message('navigation_search_result_empty'),
          ),
      ],
    );
  }
}

class _SearchKeyboardHint extends StatelessWidget {
  const _SearchKeyboardHint();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colorScheme.outline.subtle)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '↑↓ 이동  ·  Enter 열기  ·  Esc 닫기',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurface.strong,
            ),
          ),
        ],
      ),
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
  final bool selected;
  final VoidCallback? onHover;
  final VoidCallback onTap;

  const _SearchTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.selected = false,
    this.onHover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: selected ? colorScheme.surfaceContainerHigh : Colors.transparent,
      child: InkWell(
        onHover: (hovering) {
          if (hovering) onHover?.call();
        },
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            children: [
              Icon(icon, size: 20.0, color: colorScheme.outline.strong),
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
                    if (subtitle != null && subtitle!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
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
