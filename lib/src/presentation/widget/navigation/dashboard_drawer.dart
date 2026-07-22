part of '../widget.dart';

class DashboardDrawer extends HookConsumerWidget {
  final StatefulNavigationShell navigationShell;
  final Duration duration;
  final Curve curve;
  final double maxWidth;
  final double minWidth;

  const DashboardDrawer({
    super.key,
    required this.navigationShell,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInQuad,
    this.maxWidth = 256.0,
    this.minWidth = 78.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final auth = ref.watch(authControllerProvider);

    final expanded = useState(true);

    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(
        begin: expanded.value ? maxWidth : minWidth,
        end: expanded.value ? maxWidth : minWidth,
      ),
      builder: (context, width, child) {
        return Container(
          width: width,
          color: colorScheme.surfaceContainer,
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: Responsive.isDesktop(context)
                    ? 36.0
                    : MediaQuery.of(context).padding.top + 16.0,
                bottom: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationRailHeader(
                    expanded: expanded,
                    duration: duration,
                    curve: curve,
                  ),
                  const SizedBox(height: 32.0),
                  NavigationRailSearch(
                    expanded: expanded,
                    duration: duration,
                    curve: curve,
                  ),
                  const SizedBox(height: 16.0),
                  NavigationRailList(
                    navigationShell: navigationShell,
                    expanded: expanded,
                    duration: duration,
                    curve: curve,
                  ),
                ],
              ),
            ),
          ),
          if (auth is AuthAuthenticated)
            DashboardUserTile(
              expanded: expanded.value,
              duration: duration,
              curve: curve,
              user: auth.user,
            ),
        ],
      ),
    );
  }
}

class NavigationRailHeader extends StatelessWidget {
  final ValueNotifier<bool> expanded;
  final Duration duration;
  final Curve curve;

  const NavigationRailHeader({
    super.key,
    required this.expanded,
    required this.duration,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        AnimatedOpacity(
          duration: duration,
          curve: curve,
          opacity: expanded.value ? 1.0 : 0.0,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Logo(size: 40.0),
          ),
        ),
        if (Responsive.isDesktop(context))
          Positioned.fill(
            child: AnimatedContainer(
              duration: duration,
              curve: curve,
              alignment: expanded.value
                  ? Alignment.centerRight
                  : Alignment.center,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => expanded.value = !expanded.value,
                  borderRadius: BorderRadius.circular(4.0),
                  child: Ink(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      expanded.value
                          ? Symbols.left_panel_close_rounded
                          : Symbols.left_panel_open_rounded,
                      size: 24.0,
                      weight: 300.0,
                      color: colorScheme.outline,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class NavigationRailSearch extends StatelessWidget {
  final ValueNotifier<bool> expanded;
  final Duration duration;
  final Curve curve;

  const NavigationRailSearch({
    super.key,
    required this.expanded,
    required this.duration,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => const NavigationSearchDialog(),
      ),
      child: Material(
        color: Colors.transparent,
        child: IgnorePointer(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: colorScheme.onSurface.withValues(alpha: 0.1),
              label: AnimatedOpacity(
                duration: duration,
                curve: curve,
                opacity: expanded.value ? 1.0 : 0.0,
                child: Text(Intl.message('navigation_search')),
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
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationRailList extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  final ValueNotifier<bool> expanded;
  final Duration duration;
  final Curve curve;

  const NavigationRailList({
    super.key,
    required this.navigationShell,
    required this.expanded,
    required this.duration,
    required this.curve,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final items = WidgetPreset(context).navigationItems;

    // isAdmin 속성을 확인하여 items 필터링
    final filteredItems = items.where((item) {
      if (item is NavigationButton && item.isAdmin) {
        return auth is AuthAuthenticated && auth.user.isAdmin;
      }
      if (item is NavigationTitle && item.isAdmin) {
        return auth is AuthAuthenticated && auth.user.isAdmin;
      }
      return true;
    }).toList();

    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) => switch (filteredItems[index]) {
          NavigationTitle() => NavigationRailTitle(
            item: filteredItems[index] as NavigationTitle,
            expanded: expanded.value,
            duration: duration,
            curve: curve,
          ),
          NavigationButton() => NavigationRailButton(
            item: filteredItems[index] as NavigationButton,
            currentIndex: index,
            isSelected:
                navigationShell.currentIndex ==
                filteredItems.whereType<NavigationButton>().toList().indexWhere(
                  (element) => element == filteredItems[index],
                ),
            expanded: expanded.value,
            duration: duration,
            curve: curve,
          ),
          NavigationSpace() => const SizedBox(height: 16.0),
        },
        separatorBuilder: (context, index) => SizedBox(height: 4.0),
      ),
    );
  }
}

class NavigationRailTitle extends StatelessWidget {
  final NavigationTitle item;
  final bool expanded;
  final Duration duration;
  final Curve curve;

  const NavigationRailTitle({
    super.key,
    required this.item,
    required this.expanded,
    required this.duration,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedOpacity(
      duration: duration,
      curve: curve,
      opacity: expanded ? 1.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8.0, bottom: 4.0),
        child: Text(
          item.label,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}

class NavigationRailButton extends StatelessWidget {
  final NavigationButton item;
  final int currentIndex;
  final bool isSelected;
  final bool expanded;
  final Duration duration;
  final Curve curve;

  const NavigationRailButton({
    super.key,
    required this.item,
    required this.currentIndex,
    required this.isSelected,
    required this.expanded,
    required this.duration,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      clipBehavior: Clip.hardEdge,
      elevation: isSelected ? 1.0 : 0.0,
      borderRadius: BorderRadius.circular(8.0),
      color: isSelected
          ? colorScheme.surfaceBright
          : colorScheme.surfaceContainer,
      child: InkWell(
        onTap: () {
          context.goNamed(item.route);
          if (!Responsive.isDesktop(context)) {
            context.pop();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: isSelected
                  ? colorScheme.outline.withValues(alpha: 0.2)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 20.0,
                fill: isSelected ? 1.0 : 0.0,
                color: isSelected
                    ? colorScheme.onSurface
                    : colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              Flexible(
                child: AnimatedOpacity(
                  duration: duration,
                  curve: curve,
                  opacity: expanded ? 1.0 : 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected
                            ? colorScheme.onSurface
                            : colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardUserTile extends StatelessWidget {
  final bool expanded;
  final Duration? duration;
  final Curve? curve;
  final User user;

  const DashboardUserTile({
    super.key,
    this.expanded = true,
    this.duration,
    this.curve,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(8.0),
        color: colorScheme.surfaceContainer,
        child: InkWell(
          onTap: () {
            context.goNamed(RouteNames.account);
            if (!Responsive.isDesktop(context)) {
              context.pop();
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            child: Row(
              children: [
                Skeleton.unite(
                  child: CircleAvatar(
                    backgroundColor: Functions(
                      context,
                    ).generateColorFromId(user.id),
                    radius: 16.0,
                    child: Text(
                      getInitials(user.username),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Flexible(
                  child: AnimatedOpacity(
                    duration: duration ?? Duration(milliseconds: 300),
                    curve: curve ?? Curves.easeInQuad,
                    opacity: expanded ? 1.0 : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.username,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            user.email,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
