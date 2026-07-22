part of '../widget.dart';

extension NavigationWidgetPreset on WidgetPreset {
  List<NavigationItem> get navigationItems => [
    NavigationButton(
      icon: Symbols.space_dashboard_rounded,
      route: RouteNames.dashboard,
      label: Intl.message('dashboard'),
    ),
    NavigationTitle(label: Intl.message('navigation_title_1')),
    NavigationButton(
      icon: Symbols.work_rounded,
      route: RouteNames.project,
      label: Intl.message('project'),
    ),
    NavigationButton(
      icon: Symbols.laptop_windows_rounded,
      route: RouteNames.work,
      label: Intl.message('work'),
    ),
    NavigationButton(
      icon: Symbols.calendar_month_rounded,
      route: RouteNames.schedule,
      label: Intl.message('schedule'),
    ),
    NavigationTitle(label: Intl.message('navigation_title_2')),
    NavigationButton(
      icon: Symbols.newsstand_rounded,
      route: RouteNames.document,
      label: Intl.message('document'),
    ),
    NavigationButton(
      icon: Symbols.groups_rounded,
      route: RouteNames.organization,
      label: Intl.message('organization'),
    ),
    NavigationTitle(label: Intl.message('navigation_title_3'), isAdmin: true),
    NavigationButton(
      icon: Symbols.data_table_rounded,
      route: RouteNames.data,
      label: Intl.message('data'),
      isAdmin: true,
    ),
    NavigationButton(
      icon: Symbols.finance_rounded,
      route: RouteNames.analytics,
      label: Intl.message('analytics'),
      isAdmin: true,
    ),
  ];
}
