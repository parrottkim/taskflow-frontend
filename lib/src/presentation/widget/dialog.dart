part of 'widget.dart';

// ==========================================
// 0. 공통 기반 다이얼로그 (BaseDialog)
// ==========================================
class BaseDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  final double maxWidth;
  final double? maxHeight;
  final bool showDivider;
  // ⭐️ content를 감싸는 기본 패딩 속성 추가
  final EdgeInsetsGeometry contentPadding;

  const BaseDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.maxWidth = 430.0,
    this.maxHeight,
    this.showDivider = true,
    // 기본값으로 좌우 16.0 패딩 지정
    this.contentPadding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            if (showDivider)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Divider(),
              )
            else
              const SizedBox(height: 16.0),

            // ⭐️ Content 영역
            // contentPadding 속성을 부여하여 외부 패딩 유연하게 제어
            Flexible(
              child: Padding(padding: contentPadding, child: content),
            ),

            if (showDivider)
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Divider(),
              )
            else
              const SizedBox(height: 16.0),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: actions.map((action) {
                  final isLast = action == actions.last;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: isLast ? 0.0 : 4.0),
                      child: action,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. BaseDialog를 상속/활용한 알림창들
// ==========================================
class LoginForbiddenDialog extends StatelessWidget {
  const LoginForbiddenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Intl.message('login_forbidden_1'),
      content: Text(Intl.message('login_forbidden_2')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          child: Text(
            Intl.message('common_ok'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class LoginRequestDialog extends StatelessWidget {
  const LoginRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Intl.message('login_request_1'),
      content: Text(Intl.message('login_request_2')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          child: Text(
            Intl.message('common_ok'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class WrongApproachDialog extends StatelessWidget {
  const WrongApproachDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: Intl.message('wrong_approach_title'),
      content: Text(Intl.message('wrong_approach_content')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_ok'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class PopScopeDialog extends StatelessWidget {
  const PopScopeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: Intl.message('pop_scope_title'),
      content: Text(Intl.message('pop_scope_content')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(false),
          child: Text(
            Intl.message('common_stay'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_leave'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class DeleteDialog extends StatelessWidget {
  final String title;
  final String content;

  const DeleteDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: title,
      content: ContainerWidget(
        borderRadius: BorderRadius.circular(8.0),
        color: colorScheme.errorContainer,
        borderColor: colorScheme.error,
        child: Row(
          children: [
            Icon(Symbols.warning_rounded, size: 20.0, color: colorScheme.error),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                content,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(false),
          child: Text(
            Intl.message('common_cancel'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_delete'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 2. 고유 레이아웃을 가진 특수 목적 다이얼로그들
// ==========================================
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

class DatePickerDialog extends HookWidget {
  final DateTime? initialDate;
  final String? title;

  const DatePickerDialog({super.key, this.initialDate, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedDate = useState<DateTime?>(initialDate);

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title ?? Intl.message('date_title'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 400.0,
                child: Calendar.day(
                  onDateSelected: (value) {
                    selectedDate.value = value;
                  },
                  initialDate: initialDate,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedDate.value != null
                          ? () {
                              context.pop(selectedDate.value);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_ok'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
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

class DateRangePickerDialog extends HookConsumerWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? title;

  const DateRangePickerDialog({
    super.key,
    this.startDate,
    this.endDate,
    this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final rangeStartDate = useState<DateTime?>(startDate);
    final rangeEndDate = useState<DateTime?>(endDate);

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title ?? Intl.message('date_range_title'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 400.0,
                child: Calendar.range(
                  onDateRangeSelected: (value) {
                    rangeStartDate.value = value.start;
                    rangeEndDate.value = value.end;
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          rangeStartDate.value != null &&
                              rangeEndDate.value != null
                          ? () {
                              context.pop({
                                'start': rangeStartDate.value!,
                                'end': rangeEndDate.value!,
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_ok'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
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

class ErrorDialog extends ConsumerWidget {
  final Object error;
  final StackTrace stackTrace;

  const ErrorDialog({super.key, required this.error, required this.stackTrace});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 430.0, maxHeight: 430.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                Intl.message('error_dialog_1'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$error',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text('$stackTrace'),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: '$error\n$stackTrace'),
                        );

                        ref
                            .read(toastProvider)
                            .showToast(
                              child: Toast(
                                type: ToastType.standard,
                                message: Intl.message('common_copied'),
                              ),
                            );
                      },
                      child: Text(
                        Intl.message('error_dialog_2'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
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

class UserDepartmentSegmentWidget extends HookConsumerWidget {
  final UserFilterScope scope;
  final UserDepartment? department;
  final List<UserDepartment> departmentItems;

  const UserDepartmentSegmentWidget({
    super.key,
    this.scope = UserFilterScope.userSelectorDialog,
    required this.department,
    required this.departmentItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [null, ...departmentItems];
    final selectedItem = useState<UserDepartment?>(department ?? items.first);
    final controller = useTabController(initialLength: items.length);

    return TabBar(
      controller: controller,
      onTap: (index) async {
        selectedItem.value = items[index];
        ref
            .read(userFilterControllerProvider(scope).notifier)
            .setDepartment(department: selectedItem.value);
      },
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      tabs: List.generate(
        items.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            items[index]?.name ??
                Intl.message('project_form_user_department_all'),
          ),
        ),
      ),
    );
  }
}

class UserDepartmentFilterWidget extends HookWidget {
  final UserDepartment? department;
  final List<UserDepartmentGroup> departmentGroups;
  final List<UserDepartment> departmentItems;
  final ValueChanged<UserDepartment?>? onChanged;
  final ValueChanged<List<UserDepartment>>? onPathChanged;

  const UserDepartmentFilterWidget({
    super.key,
    required this.department,
    required this.departmentGroups,
    required this.departmentItems,
    this.onChanged,
    this.onPathChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedPath = useState<List<UserDepartment>>(
      _getSelectedPath(department),
    );

    useEffect(() {
      selectedPath.value = _getSelectedPath(department);
      return null;
    }, [department, departmentGroups, departmentItems]);

    return BreadcrumbDropdownButton<UserDepartment>(
      items: departmentItems,
      selectedPath: selectedPath,
      icon: const Icon(Symbols.category_rounded),
      label: Intl.message('project_form_user_department'),
      itemBuilder: (value) => Text(value.name),
      getNextLevelItems: (currentPath, allItems) =>
          _getNextLevelItems(currentPath),
      getParentItem: (currentPath, allItems, selectedItem) =>
          _getParentItem(currentPath, selectedItem),
      onChanged: (newPath) {
        onPathChanged?.call(newPath);
        onChanged?.call(newPath.isEmpty ? null : newPath.last);
      },
    );
  }

  List<UserDepartment> _getSelectedPath(UserDepartment? selectedDepartment) {
    if (selectedDepartment == null || departmentGroups.isEmpty) return [];

    final departmentsById = {for (final item in departmentItems) item.id: item};
    final path = <UserDepartment>[];
    var current = departmentsById[selectedDepartment.id];

    while (current != null) {
      path.insert(0, current);

      final parentId = _getParentId(current);
      current = parentId == null ? null : departmentsById[parentId];
    }

    return path;
  }

  List<UserDepartment> _getNextLevelItems(List<UserDepartment> currentPath) {
    if (departmentGroups.isEmpty) return departmentItems;

    final depth = currentPath.length;
    final parentId = currentPath.isEmpty ? null : currentPath.last.id;

    return departmentGroups
        .where((group) => group.depth == depth && group.parentId == parentId)
        .expand((group) => group.items)
        .toList();
  }

  UserDepartment? _getParentItem(
    List<UserDepartment> currentPath,
    UserDepartment selectedItem,
  ) {
    final index = currentPath.indexWhere((item) => item.id == selectedItem.id);
    if (index > 0) return currentPath[index - 1];

    final parentId = _getParentId(selectedItem);
    if (parentId == null) return null;

    return departmentItems.where((item) => item.id == parentId).firstOrNull;
  }

  int? _getParentId(UserDepartment item) {
    final itemGroup = departmentGroups
        .where(
          (group) => group.items.any((department) => department.id == item.id),
        )
        .firstOrNull;

    if (itemGroup == null || itemGroup.depth == 0) return null;

    return item.root ?? itemGroup.parentId;
  }
}

class UserPositionFilterWidget extends StatelessWidget {
  final UserPosition? position;
  final List<UserPosition> positionItems;
  final ValueChanged<UserPosition?> onChanged;

  const UserPositionFilterWidget({
    super.key,
    required this.position,
    required this.positionItems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedDropdownButton(
      onChanged: onChanged,
      items: positionItems,
      selectedItem: ValueNotifier(position),
      icon: const Icon(Symbols.chair_rounded),
      label: Text(
        position == null
            ? Intl.message('project_form_user_position')
            : position!.name,
      ),
      itemBuilder: (value) => Text(value.name),
    );
  }
}

enum UserSelectionType { single, multiple }

UserDepartment? _findUserDepartment({
  required List<UserDepartment> items,
  required int? departmentId,
}) {
  if (departmentId == null) return null;

  for (final item in items) {
    if (item.id == departmentId) return item;
  }

  return null;
}

UserPosition? _findUserPosition({
  required List<UserPosition> items,
  required int? positionId,
}) {
  if (positionId == null) return null;

  for (final item in items) {
    if (item.id == positionId) return item;
  }

  return null;
}

class UserSelectorDialog extends HookConsumerWidget {
  final UserSelectionType selectionType;
  final bool selectable;
  final List<User> initialSelectedUsers;
  final ValueChanged<User>? onSingleSelected;
  final ValueChanged<List<User>>? onMultiSelected;

  const UserSelectorDialog({
    super.key,
    this.selectionType = UserSelectionType.single,
    this.selectable = false,
    this.initialSelectedUsers = const [],
    this.onSingleSelected,
    this.onMultiSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final filter = ref.watch(
      userFilterControllerProvider(UserFilterScope.userSelectorDialog),
    );
    final options = ref.watch(userOptionsControllerProvider);
    final user = ref.watch(
      userListControllerProvider(UserFilterScope.userSelectorDialog),
    );

    final searchController = useTextEditingController();
    final selectedUsers = useState<List<User>>(initialSelectedUsers);

    final isSelectableMode =
        selectable || selectionType == UserSelectionType.multiple;

    bool hasUser(List<User> users, User user) {
      return users.any((element) => element.id == user.id);
    }

    Set<int> selectedIdsOf(List<User> users) {
      return users.map((item) => item.id).toSet();
    }

    void toggleUser(User target) {
      final current = List<User>.from(selectedUsers.value);
      final exists = hasUser(current, target);

      if (exists) {
        current.removeWhere((item) => item.id == target.id);
      } else {
        current.add(target);
      }

      selectedUsers.value = current;
    }

    void toggleSelectAll(List<User> visibleItems) {
      if (visibleItems.isEmpty) return;

      final current = List<User>.from(selectedUsers.value);
      final selectedIds = selectedIdsOf(current);
      final allVisibleSelected = visibleItems.every(
        (item) => selectedIds.contains(item.id),
      );

      if (allVisibleSelected) {
        final visibleIds = visibleItems.map((item) => item.id).toSet();
        current.removeWhere((item) => visibleIds.contains(item.id));
      } else {
        for (final item in visibleItems) {
          if (!selectedIds.contains(item.id)) {
            current.add(item);
            selectedIds.add(item.id);
          }
        }
      }

      selectedUsers.value = current;
    }

    final visibleItems = user.asData?.value.items ?? const <User>[];
    final selectedIds = selectedIdsOf(selectedUsers.value);
    final allVisibleSelected =
        visibleItems.isNotEmpty &&
        visibleItems.every((item) => selectedIds.contains(item.id));

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: const BoxConstraints(maxWidth: 430.0, maxHeight: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: Intl.message('project_form_user_search'),
                contentPadding: const EdgeInsets.fromLTRB(
                  12.0,
                  18.0,
                  12.0,
                  14.0,
                ),
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
              onChanged: (value) => ref
                  .read(
                    userFilterControllerProvider(
                      UserFilterScope.userSelectorDialog,
                    ).notifier,
                  )
                  .debounceSearch(search: value),
            ),
            switch (options) {
              AsyncData(value: final options) => Column(
                children: [
                  UserDepartmentSegmentWidget(
                    department: _findUserDepartment(
                      items: options.departmentItems,
                      departmentId: filter.departments?.lastOrNull,
                    ),
                    departmentItems: options.departmentItems,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      children: [
                        UserPositionFilterWidget(
                          position: _findUserPosition(
                            items: options.positionItems,
                            positionId: filter.positionId,
                          ),
                          positionItems: options.positionItems,
                          onChanged: (value) => ref
                              .read(
                                userFilterControllerProvider(
                                  UserFilterScope.userSelectorDialog,
                                ).notifier,
                              )
                              .setPosition(position: value),
                        ),
                        if (isSelectableMode) const Spacer(),
                        if (isSelectableMode)
                          TextButton(
                            onPressed: visibleItems.isEmpty
                                ? null
                                : () => toggleSelectAll(visibleItems),
                            child: Text(
                              allVisibleSelected
                                  ? Intl.message('filter_unselect_all')
                                  : Intl.message('filter_select_all'),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              AsyncError(:final error, :final stackTrace) =>
                ErrorContainerWidget(error: error, stackTrace: stackTrace),
              _ => Skeletonizer(
                child: Column(
                  children: [
                    UserDepartmentSegmentWidget(
                      department: null,
                      departmentItems: List.filled(4, UserDepartment.dummy()),
                      scope: UserFilterScope.userSelectorDialog,
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        children: [
                          Skeletonizer(
                            ignoreContainers: true,
                            child: UserPositionFilterWidget(
                              position: null,
                              positionItems: List.filled(
                                4,
                                UserPosition.dummy(),
                              ),
                              onChanged: (_) {},
                            ),
                          ),
                          if (isSelectableMode) const Spacer(),
                          if (isSelectableMode)
                            TextButton(
                              onPressed: visibleItems.isEmpty
                                  ? null
                                  : () => toggleSelectAll(visibleItems),
                              child: Text(
                                allVisibleSelected
                                    ? Intl.message('filter_unselect_all')
                                    : Intl.message('filter_select_all'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            },
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.0),
                  ),
                ),
                child: switch (user) {
                  AsyncData(:final value) => UserListDialogWidget(
                    items: value.items,
                    selectionType: selectionType,
                    selectable: selectable,
                    selectedUserIds: selectedIds,
                    onSelected: (selectedUser) {
                      onSingleSelected?.call(selectedUser);
                      Navigator.of(context).pop();
                    },
                    onToggled: toggleUser,
                  ),
                  AsyncError(:final error, :final stackTrace) =>
                    ErrorContainerWidget(error: error, stackTrace: stackTrace),
                  _ => Skeletonizer(
                    child: UserListDialogWidget(
                      items: List.filled(5, User.dummy()),
                      selectionType: selectionType,
                      selectable: selectable,
                      selectedUserIds: selectedIds,
                    ),
                  ),
                },
              ),
            ),
            if (isSelectableMode) ...[
              const Divider(height: 1.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 12.0),
                child: Row(
                  children: [
                    Text(
                      '${selectedUsers.value.length} ${Intl.message('filter_suffix')}',
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(Intl.message('common_cancel')),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: selectedUsers.value.isNotEmpty
                          ? () {
                              onMultiSelected?.call(selectedUsers.value);
                              Navigator.of(context).pop();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(Intl.message('common_apply')),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class UserListDialogWidget extends HookConsumerWidget {
  final List<User> items;
  final UserSelectionType selectionType;
  final bool selectable;
  final Set<int> selectedUserIds;
  final ValueChanged<User>? onSelected;
  final ValueChanged<User>? onToggled;

  const UserListDialogWidget({
    super.key,
    required this.items,
    this.selectionType = UserSelectionType.single,
    this.selectable = false,
    this.selectedUserIds = const <int>{},
    this.onSelected,
    this.onToggled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelectableMode =
        selectable || selectionType == UserSelectionType.multiple;

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/empty.svg',
              width: 40.0,
              height: 40.0,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface.withValues(alpha: 0.7),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(Intl.message('project_form_user_empty')),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref
              .read(
                userListControllerProvider(
                  UserFilterScope.userSelectorDialog,
                ).notifier,
              )
              .load();
        }
        return false;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedUserIds.contains(item.id);

          return ListTile(
            onTap: () {
              if (isSelectableMode) {
                onToggled?.call(item);
                return;
              }
              onSelected?.call(item);
            },
            leading: isSelectableMode
                ? CustomToggleButton(
                    value: isSelected,
                    onChanged: (_) => onToggled?.call(item),
                  )
                : null,
            title: UserInformation(
              user: item,
              showDepartment: true,
              showPosition: true,
            ),
          );
        },
      ),
    );
  }
}

class SendEmailDialog extends HookConsumerWidget {
  final String title;
  final Future<void> Function(List<User> selectedUsers, bool isAllSelected)?
  onPressed;

  const SendEmailDialog({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isAllSelected = useState(true);
    final selectedUsers = useState<List<User>>([]);

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(Intl.message('project_mail_select_1')),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomToggleButton(
                value: isAllSelected.value,
                onChanged: (value) {
                  isAllSelected.value = value ?? false;
                  if (isAllSelected.value) selectedUsers.value = [];
                },
                child: Text(Intl.message('common_send_all')),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => UserSelectorDialog(
                    selectionType: UserSelectionType.multiple,
                    initialSelectedUsers: selectedUsers.value,
                    onMultiSelected: (users) {
                      selectedUsers.value = users;
                      if (selectedUsers.value.isNotEmpty) {
                        isAllSelected.value = false;
                      }
                    },
                  ),
                ),
                icon: Icon(
                  selectedUsers.value.isEmpty
                      ? Symbols.person_rounded
                      : Symbols.people_rounded,
                ),
                label: Text(
                  selectedUsers.value.isEmpty
                      ? Intl.message('project_form_user_search')
                      : '${selectedUsers.value.length} ${Intl.message('filter_suffix')}',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          onPressed != null &&
                              (isAllSelected.value ||
                                  selectedUsers.value.isNotEmpty)
                          ? () async {
                              try {
                                await onPressed?.call(
                                  selectedUsers.value,
                                  isAllSelected.value,
                                );
                                ref
                                    .read(toastProvider)
                                    .showToast(
                                      child: Toast(
                                        message: Intl.message(
                                          'project_mail_send',
                                        ),
                                      ),
                                    );
                                if (!context.mounted) return;
                                context.pop();
                              } catch (e) {
                                ref
                                    .read(toastProvider)
                                    .showToast(
                                      child: Toast(
                                        type: ToastType.alert,
                                        message: Intl.message(
                                          'project_mail_send_fail',
                                        ),
                                      ),
                                    );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_ok'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
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
