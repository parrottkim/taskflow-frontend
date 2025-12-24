import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/dashboard_layout.dart';
import 'package:taskflow/src/presentation/screen/analytics/analytics_screen.dart';
import 'package:taskflow/src/presentation/screen/download/download_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/forgot_password/forgot_password_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/issue_category_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/project_detail_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_form/project_form_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/reset_password/reset_password_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/report_category_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_screen.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_category/schedule_category_screen.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_form/schedule_form_screen.dart';
import 'package:taskflow/src/presentation/screen/work/work_screen.dart';
import 'package:taskflow/src/presentation/screen/document/document_screen.dart';
import 'package:taskflow/src/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/login/login_screen.dart';
import 'package:taskflow/src/presentation/screen/project/project_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/register/register_screen.dart';
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
  static const String forgotPassword = 'forgot_password';
  static const String resetPassword = 'reset_password';
  static const String dashboard = 'dashboard';
  static const String project = 'project';
  static const String projectDetail = 'project_detail';
  static const String projectNew = 'project_new';
  static const String projectEdit = 'project_edit';
  static const String issueNewChoose = 'issue_new_choose';
  static const String issueNew = 'issue_new';
  static const String issueEdit = 'issue_edit';
  static const String reportNewChoose = 'report_new_choose';
  static const String reportNew = 'report_new';
  static const String reportEdit = 'report_edit';
  static const String reportStep = 'report_step';
  static const String scheduleNewChoose = 'schedule_new_choose';
  static const String scheduleNew = 'schedule_new';
  static const String scheduleEdit = 'schedule_edit';
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
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String dashboard = '/dashboard';
  static const String project = '/project';
  static const String projectNew = 'new';
  static const String projectEdit = 'edit';
  static const String issueBase = 'issue';
  static const String issueNewChoose = 'choose';
  static const String issueNew = 'new';
  static const String issueEdit = 'edit';
  static const String reportBase = 'report';
  static const String reportNewChoose = 'choose';
  static const String reportNew = 'new';
  static const String reportEdit = 'edit';
  static const String reportStep = 'step';
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
          GoRoute(
            name: RouteNames.forgotPassword,
            path: Routes.forgotPassword,
            pageBuilder: (context, state) {
              String? path = state.uri.queryParameters['redirect_to'];
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: ForgotPasswordScreen(path: path),
              );
            },
          ),
          GoRoute(
            name: RouteNames.resetPassword,
            path: Routes.resetPassword,
            pageBuilder: (context, state) {
              String? path = state.uri.queryParameters['redirect_to'];
              String? token = state.uri.queryParameters['token'];

              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: ResetPasswordScreen(path: path, token: token),
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
                      String? reportId = state.uri.queryParameters['report'];
                      final view = state.uri.queryParameters['view'];

                      return NoTransitionPage(
                        child: ProjectDetailScreen(
                          projectId: int.parse(projectId!),
                          issueId:
                              issueId != null ? int.tryParse(issueId) : null,
                          reportId:
                              reportId != null ? int.tryParse(reportId) : null,
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
                            routes: [
                              GoRoute(
                                name: RouteNames.issueNew,
                                path: '${Routes.issueNew}/:category_id',
                                redirect: (context, state) async {
                                  final projectId =
                                      state.pathParameters['project_id']!;
                                  final categoryId =
                                      state.pathParameters['category_id']!;

                                  final list = await ref.read(
                                      issueListControllerProvider(
                                              projectId: int.parse(projectId))
                                          .future);

                                  final detail = await ref.read(
                                      projectFilterControllerProvider.future);
                                  final selectedCategory = detail.categoryItems
                                      .firstWhere(
                                          (c) => c.id.toString() == categoryId);

                                  bool isDuplicate = false;

                                  if (selectedCategory is IssueContract &&
                                      list.contract != null) {
                                    isDuplicate = true;
                                  } else if (selectedCategory is IssueKickoff &&
                                      list.kickoff != null) {
                                    isDuplicate = true;
                                  } else if (selectedCategory
                                          is IssueTransaction &&
                                      list.transaction != null) {
                                    isDuplicate = true;
                                  } else if (selectedCategory is IssuePayment &&
                                      list.payment != null) {
                                    isDuplicate = true;
                                  }

                                  if (isDuplicate) {
                                    return state.namedLocation(
                                      RouteNames.issueNewChoose,
                                      pathParameters: {'project_id': projectId},
                                    );
                                  }

                                  return null;
                                },
                                pageBuilder: (context, state) {
                                  String? categoryId =
                                      state.pathParameters['category_id'];
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
                                  final error =
                                      ref.watch(errorControllerProvider);
                                  final submit =
                                      ref.watch(issueSubmitControllerProvider);

                                  if (error is ErrorUnauthorized) {
                                    return true;
                                  }

                                  if (submit is! IssueSubmitSuccess &&
                                      submit is! IssueSubmitDeleted) {
                                    final shouldNavigate =
                                        await showDialog<bool>(
                                      context: context,
                                      builder: (context) =>
                                          const PopScopeDialog(),
                                    );
                                    return shouldNavigate ?? false;
                                  }
                                  return true;
                                },
                              ),
                            ],
                          ),
                          GoRoute(
                            name: RouteNames.issueEdit,
                            path: ':issue_id/${Routes.issueEdit}/:category_id',
                            pageBuilder: (context, state) {
                              String? categoryId =
                                  state.pathParameters['category_id'];
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
                        path: Routes.reportBase,
                        redirect: (context, state) {
                          if (state.uri.path == Routes.reportBase) {
                            return '${Routes.reportBase}/${Routes.reportNew}';
                          }
                          return null;
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.reportNewChoose,
                            path: Routes.reportNewChoose, // 예: choose
                            pageBuilder: (context, state) {
                              String? projectId =
                                  state.pathParameters['project_id'];

                              return NoTransitionPage(
                                child: ReportCategoryScreen(
                                  projectId: int.parse(projectId!),
                                ),
                              );
                            },
                            routes: [
                              // 2. 신규 작성 (ReportNew) - 다단계 폼 시작점
                              GoRoute(
                                name: RouteNames.reportNew,
                                path: Routes.reportNew,
                                redirect: (context, state) async {
                                  final projectId =
                                      state.pathParameters['project_id']!;

                                  final form = await ref.read(
                                      reportFormControllerProvider(
                                              projectId: int.parse(projectId))
                                          .future);

                                  final step =
                                      state.uri.queryParameters['step'];

                                  if (step == null) {
                                    return state.namedLocation(
                                      RouteNames
                                          .reportNew, // 혹은 RouteNames.reportEdit
                                      pathParameters: state.pathParameters,
                                      queryParameters: {
                                        'step': form.steps.first
                                      },
                                    );
                                  }

                                  return null;
                                },
                                pageBuilder: (context, state) {
                                  final projectId =
                                      state.pathParameters['project_id']!;
                                  final step =
                                      state.uri.queryParameters['step']!;

                                  return NoTransitionPage(
                                    child: ReportFormScreen(
                                      projectId: int.parse(projectId),
                                      step: step,
                                    ),
                                  );
                                },
                                onExit: (context, state) async {
                                  final error =
                                      ref.watch(errorControllerProvider);
                                  final submit =
                                      ref.watch(reportSubmitControllerProvider);

                                  if (error is ErrorUnauthorized) {
                                    return true;
                                  }

                                  if (submit is! ReportSubmitSuccess &&
                                      submit is! ReportSubmitDeleted) {
                                    final shouldNavigate =
                                        await showDialog<bool>(
                                      context: context,
                                      builder: (context) =>
                                          const PopScopeDialog(),
                                    );
                                    return shouldNavigate ?? false;
                                  }
                                  return true;
                                },
                              ),
                            ],
                          ),
                          GoRoute(
                            name: RouteNames.reportEdit,
                            path: ':report_id/${Routes.reportEdit}',
                            redirect: (context, state) async {
                              final projectId =
                                  state.pathParameters['project_id']!;
                              final reportId =
                                  state.pathParameters['report_id']!;

                              final form = await ref.read(
                                  reportFormControllerProvider(
                                          projectId: int.parse(projectId),
                                          reportId: int.parse(reportId))
                                      .future);

                              final step = state.uri.queryParameters['step'];

                              if (step == null) {
                                return state.namedLocation(
                                  RouteNames.reportEdit,
                                  pathParameters: state.pathParameters,
                                  queryParameters: {'step': form.steps.first},
                                );
                              }

                              return null;
                            },
                            pageBuilder: (context, state) {
                              final projectId =
                                  state.pathParameters['project_id']!;
                              final reportId =
                                  state.pathParameters['report_id']!;
                              final step = state.uri.queryParameters['step']!;

                              // ReportFormScreen이 step을 내부에서 처리합니다.
                              return NoTransitionPage(
                                child: ReportFormScreen(
                                  projectId: int.parse(projectId),
                                  reportId: int.parse(reportId),
                                  step: step,
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit =
                                  ref.watch(reportSubmitControllerProvider);

                              if (error is ErrorUnauthorized) {
                                return true;
                              }

                              if (submit is! ReportSubmitSuccess &&
                                  submit is! ReportSubmitDeleted) {
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
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _workKey,
            routes: [
              GoRoute(
                name: RouteNames.work,
                path: Routes.work,
                pageBuilder: (context, state) {
                  final view = state.uri.queryParameters['view'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: WorkScreen(view: view),
                  );
                },
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
                        pageBuilder: (context, state) {
                          String? path =
                              state.uri.queryParameters['redirect_to'];

                          return NoTransitionPage(
                            key: state.pageKey,
                            name: state.name,
                            child: ScheduleCategoryScreen(path: path),
                          );
                        },
                        routes: [
                          GoRoute(
                            name: RouteNames.scheduleNew,
                            path: Routes.scheduleNew,
                            pageBuilder: (context, state) {
                              String? path =
                                  state.uri.queryParameters['redirect_to'];
                              String? categoryId =
                                  state.uri.queryParameters['category'];

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: ScheduleFormScreen(
                                  path: path,
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
                        ],
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
                pageBuilder: (context, state) {
                  final view = state.uri.queryParameters['view'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: SettingScreen(view: view),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.download,
        path: Routes.download,
        pageBuilder: (context, state) {
          final type = state.uri.queryParameters['type']!;
          final id = state.uri.queryParameters['id']!;

          return NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: DownloadScreen(type: type, id: int.parse(id)),
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
