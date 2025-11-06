import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/dashboard_layout.dart';
import 'package:taskflow/src/presentation/screen/analytics/analytics_screen.dart';
import 'package:taskflow/src/presentation/screen/download/download_screen.dart';
import 'package:taskflow/src/presentation/screen/issue_category/issue_category_screen.dart';
import 'package:taskflow/src/presentation/screen/issue_form/issue_form_screen.dart';
import 'package:taskflow/src/presentation/screen/project_detail/project_detail_screen.dart';
import 'package:taskflow/src/presentation/screen/project_form/project_form_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule_category/schedule_category_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule_form/schedule_form_screen.dart';
import 'package:taskflow/src/presentation/screen/trip_form/trip_form_screen.dart';
import 'package:taskflow/src/presentation/screen/work/work_screen.dart';
import 'package:taskflow/src/presentation/screen/document/document_screen.dart';
import 'package:taskflow/src/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:taskflow/src/presentation/screen/login/login_screen.dart';
import 'package:taskflow/src/presentation/screen/project/project_screen.dart';
import 'package:taskflow/src/presentation/screen/register/register_screen.dart';
import 'package:taskflow/src/presentation/screen/setting/setting_screen.dart';
import 'package:taskflow/src/presentation/screen/splash/splash_screen.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/router/transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

part 'router_interceptor.dart';
part 'router_notifier.dart';

final _key = GlobalKey<NavigatorState>();
final _dashboardKey = GlobalKey<NavigatorState>();
final _projectKey = GlobalKey<NavigatorState>();
final _workKey = GlobalKey<NavigatorState>();
final _documentKey = GlobalKey<NavigatorState>();
final _analyticsKey = GlobalKey<NavigatorState>();
final _setttingKey = GlobalKey<NavigatorState>();

class RouteNames {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String download = 'download';
  static const String register = 'register';
  static const String dashboard = 'dashboard';
  static const String project = 'project';
  static const String projectDetail = 'project_detail';
  static const String projectNew = 'project_new';
  static const String projectEdit = 'project_edit';
  static const String issueNewChoose = 'issue_new_choose';
  static const String issueNew = 'issue_new';
  static const String issueEdit = 'issue_edit';
  static const String tripNew = 'trip_new';
  static const String tripEdit = 'trip_edit';
  static const String scheduleNewChoose = 'schedule_new_choose';
  static const String scheduleNew = 'schedule_new';
  static const String scheduleEdit = 'schdule_edit';
  static const String work = 'work';
  static const String document = 'document';
  static const String analytics = 'analytics';
  static const String setting = 'setting';
}

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String download = '/download';
  static const String register = 'register';
  static const String dashboard = '/dashboard';
  static const String project = '/project';
  static const String projectNew = 'new';
  static const String projectEdit = 'edit';
  static const String issueBase = 'issue';
  static const String issueNewChoose = 'choose';
  static const String issueNew = 'new';
  static const String issueEdit = 'edit';
  static const String tripBase = 'trip';
  static const String tripNew = 'new';
  static const String tripEdit = 'edit';
  static const String scheduleBase = '/schedule';
  static const String scheduleNewChoose = 'choose';
  static const String scheduleNew = 'new';
  static const String scheduleEdit = 'edit';
  static const String work = '/work';
  static const String document = '/document';
  static const String analytics = '/analytics';
  static const String setting = '/setting';
}

@riverpod
AppRouter router(Ref ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return AppRouter(
      ref, notifier, ref.watch(routerInterceptorProvider), Routes.splash);
}

class AppRouter {
  final Ref ref;
  final Listenable notifier;
  final RouterInterceptor interceptor;
  final String initialLocation;

  AppRouter(
    this.ref,
    this.notifier,
    this.interceptor,
    this.initialLocation,
  );

  late final GoRouter config = GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: initialLocation,
    refreshListenable: notifier,
    redirect: (context, state) async {
      final String? result = await interceptor.canGo(context, state);
      if (result != null) return result;
      return null;
    },
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: Routes.splash,
        pageBuilder: (context, state) {
          String? path = state.uri.queryParameters['redirect_to'];
          return NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: SplashScreen(path: path),
          );
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: Routes.login,
        pageBuilder: (context, state) {
          String? path = state.uri.queryParameters['redirect_to'];
          return buildFadeTransition(
              context: context, state: state, child: LoginScreen(path: path));
        },
        routes: [
          GoRoute(
            name: RouteNames.register,
            path: Routes.register,
            pageBuilder: (context, state) {
              String? path = state.uri.queryParameters['redirect_to'];
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: RegisterScreen(path: path),
              );
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (_, state, navigationShell) => MaterialPage<void>(
          key: state.pageKey,
          restorationId: state.pageKey.value,
          child: DashboardLayout(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _dashboardKey,
            routes: [
              GoRoute(
                name: RouteNames.dashboard,
                path: Routes.dashboard,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: DashboardScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _projectKey,
            routes: [
              GoRoute(
                name: RouteNames.project,
                path: Routes.project,
                pageBuilder: (context, state) {
                  final view = state.uri.queryParameters['view'];
                  final sort = state.uri.queryParameters['sort'];
                  final order = state.uri.queryParameters['order'];
                  final search = state.uri.queryParameters['search'];
                  final bookmark = state.uri.queryParameters['bookmark'];
                  final clients = state.uri.queryParameters['clients'];
                  final categories = state.uri.queryParameters['categories'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: ProjectScreen(
                      view: view,
                      sort: sort,
                      order: order,
                      search: search,
                      bookmark: bookmark,
                      clients: clients,
                      categories: categories,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.projectNew,
                    path: Routes.projectNew,
                    parentNavigatorKey: _projectKey,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: ProjectFormScreen(),
                      );
                    },
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(projectSubmitControllerProvider);

                      if (error is ErrorUnauthorized) {
                        return true;
                      }

                      if (submit is! ProjectSubmitSuccess &&
                          submit is! ProjectSubmitDeleted) {
                        final shouldNavigate = await showDialog<bool>(
                          context: context,
                          builder: (context) => const PopScopeDialog(),
                        );
                        return shouldNavigate ?? false;
                      }
                      return true;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.projectEdit,
                    path: ':project_id/${Routes.projectEdit}',
                    parentNavigatorKey: _projectKey,
                    pageBuilder: (context, state) {
                      String? projectId = state.pathParameters['project_id'];

                      return NoTransitionPage(
                        child:
                            ProjectFormScreen(projectId: int.parse(projectId!)),
                      );
                    },
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(projectSubmitControllerProvider);

                      if (error is ErrorUnauthorized) {
                        return true;
                      }

                      if (submit is! ProjectSubmitSuccess &&
                          submit is! ProjectSubmitDeleted) {
                        final shouldNavigate = await showDialog<bool>(
                          context: context,
                          builder: (context) => const PopScopeDialog(),
                        );
                        return shouldNavigate ?? false;
                      }
                      return true;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.projectDetail,
                    path: ':project_id',
                    parentNavigatorKey: _projectKey,
                    pageBuilder: (context, state) {
                      String? projectId = state.pathParameters['project_id'];
                      String? issueId = state.uri.queryParameters['issue'];
                      String? tripId = state.uri.queryParameters['trip'];
                      final view = state.uri.queryParameters['view'];

                      return NoTransitionPage(
                        child: ProjectDetailScreen(
                          projectId: int.parse(projectId!),
                          issueId:
                              issueId != null ? int.tryParse(issueId) : null,
                          tripId: tripId != null ? int.tryParse(tripId) : null,
                          view: view,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: Routes.issueBase,
                        redirect: (context, state) {
                          if (state.uri.path == Routes.issueBase) {
                            return '${Routes.issueBase}/${Routes.issueNewChoose}';
                          }
                          return null;
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.issueNewChoose,
                            path: Routes.issueNewChoose,
                            pageBuilder: (context, state) {
                              String? projectId =
                                  state.pathParameters['project_id'];

                              return NoTransitionPage(
                                child: IssueCategoryScreen(
                                  projectId: int.parse(projectId!),
                                ),
                              );
                            },
                          ),
                          GoRoute(
                            name: RouteNames.issueNew,
                            path: Routes.issueNew,
                            pageBuilder: (context, state) {
                              String? categoryId =
                                  state.uri.queryParameters['category'];
                              String? projectId =
                                  state.pathParameters['project_id'];

                              return NoTransitionPage(
                                child: IssueFormScreen(
                                  categoryId: int.parse(categoryId!),
                                  projectId: int.parse(projectId!),
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit =
                                  ref.watch(issueSubmitControllerProvider);

                              if (error is ErrorUnauthorized) {
                                return true;
                              }

                              if (submit is! IssueSubmitSuccess &&
                                  submit is! IssueSubmitDeleted) {
                                final shouldNavigate = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => const PopScopeDialog(),
                                );
                                return shouldNavigate ?? false;
                              }
                              return true;
                            },
                          ),
                          GoRoute(
                            name: RouteNames.issueEdit,
                            path: ':issue_id/${Routes.issueEdit}',
                            pageBuilder: (context, state) {
                              String? categoryId =
                                  state.uri.queryParameters['category'];
                              String? projectId =
                                  state.pathParameters['project_id'];
                              String? issueId =
                                  state.pathParameters['issue_id'];

                              return NoTransitionPage(
                                child: IssueFormScreen(
                                  categoryId: int.parse(categoryId!),
                                  projectId: int.parse(projectId!),
                                  issueId: issueId != null
                                      ? int.tryParse(issueId)
                                      : null,
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit =
                                  ref.watch(issueSubmitControllerProvider);

                              if (error is ErrorUnauthorized) {
                                return true;
                              }

                              if (submit is! IssueSubmitSuccess &&
                                  submit is! IssueSubmitDeleted) {
                                final shouldNavigate = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => const PopScopeDialog(),
                                );
                                return shouldNavigate ?? false;
                              }
                              return true;
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: Routes.tripBase,
                        redirect: (context, state) {
                          if (state.uri.path == Routes.tripBase) {
                            return '${Routes.tripBase}/${Routes.tripNew}';
                          }
                          return null;
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.tripNew,
                            path: Routes.tripNew,
                            redirect:
                                (BuildContext context, GoRouterState state) {
                              final step = state.uri.queryParameters['step'];
                              final extra = state.extra;
                              // step이 있고, extra로 내부 네비게이션 표시가 없으면 redirect 실행
                              if (step != null &&
                                  !(extra is Map &&
                                      extra['internal'] == true)) {
                                // same route but without queryParameters (즉 step 제거)
                                return state.namedLocation(
                                  RouteNames.tripNew,
                                  pathParameters: {
                                    'project_id':
                                        state.pathParameters['project_id']!
                                  },
                                  queryParameters: {}, // step 제거
                                );
                              }
                              return null; // redirect 없음
                            },
                            pageBuilder: (context, state) {
                              String? projectId =
                                  state.pathParameters['project_id'];

                              return NoTransitionPage(
                                child: TripFormScreen(
                                  projectId: int.parse(projectId!),
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit =
                                  ref.watch(tripSubmitControllerProvider);

                              if (error is ErrorUnauthorized) {
                                return true;
                              }

                              if (submit is! TripSubmitSuccess &&
                                  submit is! TripSubmitDeleted) {
                                final shouldNavigate = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => const PopScopeDialog(),
                                );
                                return shouldNavigate ?? false;
                              }
                              return true;
                            },
                          ),
                          GoRoute(
                              name: RouteNames.tripEdit,
                              path: ':trip_id/${Routes.tripEdit}',
                              pageBuilder: (context, state) {
                                String? projectId =
                                    state.pathParameters['project_id'];
                                String? tripId =
                                    state.pathParameters['trip_id'];

                                return NoTransitionPage(
                                  child: TripFormScreen(
                                    projectId: int.parse(projectId!),
                                    tripId: int.parse(tripId!),
                                  ),
                                );
                              },
                              onExit: (context, state) async {
                                final error =
                                    ref.watch(errorControllerProvider);
                                final submit =
                                    ref.watch(tripSubmitControllerProvider);

                                if (error is ErrorUnauthorized) {
                                  return true;
                                }

                                if (submit is! TripSubmitSuccess &&
                                    submit is! TripSubmitDeleted) {
                                  final shouldNavigate = await showDialog<bool>(
                                    context: context,
                                    builder: (context) =>
                                        const PopScopeDialog(),
                                  );
                                  return shouldNavigate ?? false;
                                }
                                return true;
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _workKey,
            routes: [
              GoRoute(
                name: RouteNames.work,
                path: Routes.work,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: WorkScreen(),
                ),
                routes: [
                  GoRoute(
                    path: Routes.scheduleBase,
                    redirect: (context, state) {
                      if (state.uri.path == Routes.scheduleBase) {
                        return '${Routes.scheduleBase}/${Routes.scheduleNewChoose}';
                      }
                      return null;
                    },
                    routes: [
                      GoRoute(
                        name: RouteNames.scheduleNewChoose,
                        path: Routes.scheduleNewChoose,
                        pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          name: state.name,
                          child: ScheduleCategoryScreen(),
                        ),
                      ),
                      GoRoute(
                        name: RouteNames.scheduleNew,
                        path: Routes.scheduleNew,
                        pageBuilder: (context, state) {
                          String? categoryId =
                              state.uri.queryParameters['category'];

                          return NoTransitionPage(
                            key: state.pageKey,
                            name: state.name,
                            child: ScheduleFormScreen(
                              categoryId: int.parse(categoryId!),
                            ),
                          );
                        },
                        onExit: (context, state) async {
                          final error = ref.watch(errorControllerProvider);
                          final submit =
                              ref.watch(scheduleSubmitControllerProvider);

                          if (error is ErrorUnauthorized) {
                            return true;
                          }

                          if (submit is! ScheduleSubmitSuccess &&
                              submit is! ScheduleSubmitDeleted) {
                            final shouldNavigate = await showDialog<bool>(
                              context: context,
                              builder: (context) => const PopScopeDialog(),
                            );
                            return shouldNavigate ?? false;
                          }
                          return true;
                        },
                      ),
                      GoRoute(
                        name: RouteNames.scheduleEdit,
                        path: ':schedule_id/${Routes.scheduleEdit}',
                        pageBuilder: (context, state) {
                          String? categoryId =
                              state.uri.queryParameters['category'];
                          String? scheduleId =
                              state.pathParameters['schedule_id'];

                          return NoTransitionPage(
                            key: state.pageKey,
                            name: state.name,
                            child: ScheduleFormScreen(
                              categoryId: int.parse(categoryId!),
                              scheduleId: int.parse(scheduleId!),
                            ),
                          );
                        },
                        onExit: (context, state) async {
                          final error = ref.watch(errorControllerProvider);
                          final submit =
                              ref.watch(scheduleSubmitControllerProvider);

                          if (error is ErrorUnauthorized) {
                            return true;
                          }

                          if (submit is! ScheduleSubmitSuccess &&
                              submit is! ScheduleSubmitDeleted) {
                            final shouldNavigate = await showDialog<bool>(
                              context: context,
                              builder: (context) => const PopScopeDialog(),
                            );
                            return shouldNavigate ?? false;
                          }
                          return true;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _documentKey,
            routes: [
              GoRoute(
                name: RouteNames.document,
                path: Routes.document,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: DocumentScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _analyticsKey,
            routes: [
              GoRoute(
                name: RouteNames.analytics,
                path: Routes.analytics,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: AnalyticsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _setttingKey,
            routes: [
              GoRoute(
                name: RouteNames.setting,
                path: Routes.setting,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: SettingScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.download,
        path: Routes.download,
        pageBuilder: (context, state) {
          final path = state.uri.queryParameters['path'];
          final filename = state.uri.queryParameters['filename'];

          return NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: DownloadScreen(path: path, filename: filename),
          );
        },
      ),
    ],
  );
}

extension GoRouterExtension on GoRouter {
  String location() {
    final config = routerDelegate.currentConfiguration;
    final uri = (config.last is ImperativeRouteMatch)
        ? (config.last as ImperativeRouteMatch).matches.uri
        : config.uri;
    return uri.toString();
  }

  String? get path {
    final last = routerDelegate.currentConfiguration.routes.last;
    return last is GoRoute ? last.path : null;
  }

  String get name {
    final last = routerDelegate.currentConfiguration.last;
    return last.route.name ?? '';
  }
}
