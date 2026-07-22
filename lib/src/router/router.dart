import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/src/presentation/controller/analytics/analytics_screen.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/dashboard_layout.dart';
import 'package:taskflow/src/presentation/screen/organization/organization_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule/schedule_screen.dart';
import 'package:taskflow/src/presentation/screen/download/download_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/forgot_password/forgot_password_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/issue_category_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_request_form/procurement_request_form_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_action/project_action_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/project_detail_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_form/project_form_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/reset_password/reset_password_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/report_category_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_screen.dart';
import 'package:taskflow/src/presentation/screen/data/data_screen.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/widget/supplier_edit_dialog.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_edit_dialog.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_folder_edit_dialog.dart';
import 'package:taskflow/src/presentation/screen/document/document_detail_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_category/schedule_category_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_form/schedule_form_screen.dart';
import 'package:taskflow/src/presentation/screen/work/work_screen.dart';
import 'package:taskflow/src/presentation/screen/document/document_screen.dart';
import 'package:taskflow/src/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/login/login_screen.dart';
import 'package:taskflow/src/presentation/screen/project/project_screen.dart';
import 'package:taskflow/src/presentation/screen/auth/register/register_screen.dart';
import 'package:taskflow/src/presentation/screen/account/account_screen.dart';
import 'package:taskflow/src/presentation/screen/splash/splash_screen.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
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
final _organizationKey = GlobalKey<NavigatorState>();
final _dataKey = GlobalKey<NavigatorState>();
final _scheduleKey = GlobalKey<NavigatorState>();
final _analyticsKey = GlobalKey<NavigatorState>();
final _accountKey = GlobalKey<NavigatorState>();

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
  static const String projectAction = 'project_action';
  static const String projectNew = 'project_new';
  static const String projectEdit = 'project_edit';
  static const String issueNewChoose = 'issue_new_choose';
  static const String issueNew = 'issue_new';
  static const String issueEdit = 'issue_edit';
  static const String issueProcurementRequestNew =
      'issue_procurement_request_new';
  static const String issueProcurementRequestEdit =
      'issue_procurement_request_edit';
  static const String reportNewChoose = 'report_new_choose';
  static const String reportNew = 'report_new';
  static const String reportEdit = 'report_edit';
  static const String reportStep = 'report_step';
  static const String work = 'work';
  static const String schedule = 'schedule';
  static const String scheduleNewChoose = 'schedule_new_choose';
  static const String scheduleNew = 'schedule_new';
  static const String scheduleEdit = 'schedule_edit';
  static const String document = 'document';
  static const String documentDetail = 'document_detail';
  static const String documentNew = 'document_new';
  static const String documentEdit = 'document_edit';
  static const String documentFolderNew = 'document_folder_new';
  static const String documentFolderEdit = 'document_folder_edit';
  static const String organization = 'organization';
  static const String data = 'data';
  static const String supplierNew = 'supplier_new';
  static const String supplierEdit = 'supplier_edit';
  static const String analytics = 'analytics';
  static const String account = 'account';
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
  static const String projectAction = 'action';
  static const String issueBase = 'issue';
  static const String issueNewChoose = 'choose';
  static const String issueNew = 'new';
  static const String issueEdit = 'edit';
  static const String issueProcurementRequest = 'procurement/request';
  static const String issueProcurementRequestNew =
      '$issueProcurementRequest/new';
  static const String issueProcurementRequestEdit =
      '$issueProcurementRequest/:request_id/edit';
  static const String reportBase = 'report';
  static const String reportNewChoose = 'choose';
  static const String reportNew = 'new';
  static const String reportEdit = 'edit';
  static const String reportStep = 'step';
  static const String schedule = '/schedule';
  static const String scheduleNewChoose = 'choose';
  static const String scheduleNew = 'new';
  static const String scheduleEdit = 'edit';
  static const String work = '/work';
  static const String document = '/document';
  static const String documentFolderBase = 'folder';
  static const String documentNew = 'new';
  static const String documentEdit = 'edit';
  static const String organization = '/organization';
  static const String data = '/data';
  static const String supplierBase = 'supplier';
  static const String supplierNew = 'new';
  static const String supplierEdit = 'edit';
  static const String analytics = '/analytics';
  static const String account = '/account';
}

@riverpod
AppRouter router(Ref ref) {
  return AppRouter(
    ref,
    ref.watch(routerListenableProvider.notifier),
    ref.watch(routerInterceptorProvider),
    Routes.splash,
  );
}

class AppRouter {
  final Ref ref;
  final Listenable notifier;
  final RouterInterceptor interceptor;
  final String initialLocation;

  AppRouter(this.ref, this.notifier, this.interceptor, this.initialLocation);

  Future<String?> _showWrongApproachAndGoDashboard(BuildContext context) async {
    final navigatorContext = _key.currentContext;

    if (navigatorContext == null) {
      return Routes.dashboard;
    }

    await showDialog(
      context: navigatorContext,
      barrierDismissible: false,
      builder: (_) => const WrongApproachDialog(),
    );

    return Routes.dashboard;
  }

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
          return NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: SplashScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: Routes.login,
        pageBuilder: (context, state) {
          final path = state.uri.queryParameters['redirect_to'];

          return buildFadeTransition(
            context: context,
            state: state,
            child: LoginScreen(path: path),
          );
        },
        routes: [
          GoRoute(
            name: RouteNames.register,
            path: Routes.register,
            pageBuilder: (context, state) {
              final path = state.uri.queryParameters['redirect_to'];

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
              final path = state.uri.queryParameters['redirect_to'];

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
              final path = state.uri.queryParameters['redirect_to'];
              final token = state.uri.queryParameters['token'];

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
                        key: state.pageKey,
                        name: state.name,
                        child: ProjectFormScreen(),
                      );
                    },
                    onExit: (context, state) async {
                      final error = ref.read(errorControllerProvider);
                      final submit = ref.read(projectSubmitControllerProvider);

                      // 1. 이미 에러가 있거나, 제출이 완료된 상태면 즉시 통과
                      if (error is ErrorUnauthorized ||
                          submit is ProjectSubmitCreated ||
                          submit is ProjectSubmitUpdated ||
                          submit is ProjectSubmitDeleted) {
                        return true;
                      }

                      // 3. 위 조건에 해당하지 않을 때만 다이얼로그 노출
                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        barrierDismissible: false, // 실수 클릭 방지
                        builder: (context) => const PopScopeDialog(),
                      );

                      return shouldNavigate ?? false;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.projectEdit,
                    path: ':project_id/${Routes.projectEdit}',
                    parentNavigatorKey: _projectKey,
                    pageBuilder: (context, state) {
                      final projectId = int.tryParse(
                        state.pathParameters['project_id'] ?? '',
                      );

                      return NoTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: ProjectFormScreen(projectId: projectId),
                      );
                    },
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(projectSubmitControllerProvider);

                      if (error is ErrorUnauthorized ||
                          submit is ProjectSubmitCreated ||
                          submit is ProjectSubmitUpdated ||
                          submit is ProjectSubmitDeleted) {
                        return true;
                      }

                      // 3. 위 조건에 해당하지 않을 때만 다이얼로그 노출
                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        barrierDismissible: false, // 실수 클릭 방지
                        builder: (context) => const PopScopeDialog(),
                      );

                      return shouldNavigate ?? false;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.projectDetail,
                    path: ':project_id',
                    parentNavigatorKey: _projectKey,
                    pageBuilder: (context, state) {
                      final projectId = int.parse(
                        state.pathParameters['project_id']!,
                      );
                      final issueId = int.tryParse(
                        state.uri.queryParameters['issue'] ?? '',
                      );
                      final reportId = int.tryParse(
                        state.uri.queryParameters['report'] ?? '',
                      );
                      final view = state.uri.queryParameters['view'];

                      return NoTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: ProjectDetailScreen(
                          projectId: projectId,
                          issueId: issueId,
                          reportId: reportId,
                          view: view,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: RouteNames.projectAction,
                        path: Routes.projectAction,
                        parentNavigatorKey: _projectKey,
                        pageBuilder: (context, state) {
                          final projectId = int.parse(
                            state.pathParameters['project_id']!,
                          );

                          return NoTransitionPage(
                            key: state.pageKey,
                            name: state.name,
                            child: ProjectActionScreen(projectId: projectId),
                          );
                        },
                      ),
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
                              final projectId = int.parse(
                                state.pathParameters['project_id']!,
                              );

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: IssueCategoryScreen(
                                  projectId: projectId,
                                ),
                              );
                            },
                            routes: [
                              GoRoute(
                                name: RouteNames.issueNew,
                                path: '${Routes.issueNew}/:category_id',
                                pageBuilder: (context, state) {
                                  final projectId = int.parse(
                                    state.pathParameters['project_id']!,
                                  );
                                  final categoryId = int.parse(
                                    state.pathParameters['category_id']!,
                                  );
                                  final issueId = int.tryParse(
                                    state.pathParameters['issue_id'] ?? '',
                                  );

                                  return NoTransitionPage(
                                    key: state.pageKey,
                                    name: state.name,
                                    child: IssueFormScreen(
                                      projectId: projectId,
                                      categoryId: categoryId,
                                      issueId: issueId,
                                    ),
                                  );
                                },
                                onExit: (context, state) async {
                                  final error = ref.watch(
                                    errorControllerProvider,
                                  );
                                  final submit = ref.watch(
                                    issueSubmitControllerProvider,
                                  );

                                  if (error is ErrorUnauthorized ||
                                      submit is IssueSubmitCreated ||
                                      submit is IssueSubmitUpdated ||
                                      submit is IssueSubmitDeleted) {
                                    return true;
                                  }

                                  final shouldNavigate = await showDialog<bool>(
                                    context: context,
                                    builder: (context) =>
                                        const PopScopeDialog(),
                                  );
                                  return shouldNavigate ?? false;
                                },
                              ),
                            ],
                          ),
                          GoRoute(
                            name: RouteNames.issueEdit,
                            path: ':issue_id/${Routes.issueEdit}/:category_id',
                            parentNavigatorKey: _projectKey,
                            pageBuilder: (context, state) {
                              final projectId = int.parse(
                                state.pathParameters['project_id']!,
                              );
                              final categoryId = int.parse(
                                state.pathParameters['category_id']!,
                              );
                              final issueId = int.tryParse(
                                state.pathParameters['issue_id'] ?? '',
                              );

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: IssueFormScreen(
                                  projectId: projectId,
                                  categoryId: categoryId,
                                  issueId: issueId,
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit = ref.watch(
                                issueSubmitControllerProvider,
                              );

                              if (error is ErrorUnauthorized ||
                                  submit is IssueSubmitCreated ||
                                  submit is IssueSubmitUpdated ||
                                  submit is IssueSubmitDeleted) {
                                return true;
                              }

                              final shouldNavigate = await showDialog<bool>(
                                context: context,
                                builder: (context) => const PopScopeDialog(),
                              );
                              return shouldNavigate ?? false;
                            },
                          ),
                          GoRoute(
                            name: RouteNames.issueProcurementRequestNew,
                            path:
                                ':issue_id/${Routes.issueProcurementRequestNew}',
                            parentNavigatorKey: _projectKey,
                            pageBuilder: (context, state) {
                              final projectId = int.parse(
                                state.pathParameters['project_id']!,
                              );
                              final issueId = int.parse(
                                state.pathParameters['issue_id']!,
                              );

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: ProcurementRequestFormScreen(
                                  projectId: projectId,
                                  issueId: issueId,
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit = ref.watch(
                                issueSubmitControllerProvider,
                              );

                              if (error is ErrorUnauthorized ||
                                  submit is IssueSubmitCreated ||
                                  submit is IssueSubmitUpdated ||
                                  submit is IssueSubmitDeleted) {
                                return true;
                              }

                              final shouldNavigate = await showDialog<bool>(
                                context: context,
                                builder: (context) => const PopScopeDialog(),
                              );
                              return shouldNavigate ?? false;
                            },
                          ),
                          GoRoute(
                            name: RouteNames.issueProcurementRequestEdit,
                            path:
                                ':issue_id/${Routes.issueProcurementRequestEdit}',
                            parentNavigatorKey: _projectKey,
                            pageBuilder: (context, state) {
                              final projectId = int.parse(
                                state.pathParameters['project_id']!,
                              );
                              final issueId = int.parse(
                                state.pathParameters['issue_id']!,
                              );
                              final requestId = int.parse(
                                state.pathParameters['request_id']!,
                              );

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: ProcurementRequestFormScreen(
                                  projectId: projectId,
                                  issueId: issueId,
                                  requestId: requestId,
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit = ref.watch(
                                issueSubmitControllerProvider,
                              );

                              if (error is ErrorUnauthorized ||
                                  submit is IssueSubmitCreated ||
                                  submit is IssueSubmitUpdated ||
                                  submit is IssueSubmitDeleted) {
                                return true;
                              }

                              final shouldNavigate = await showDialog<bool>(
                                context: context,
                                builder: (context) => const PopScopeDialog(),
                              );
                              return shouldNavigate ?? false;
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
                            parentNavigatorKey: _projectKey,
                            pageBuilder: (context, state) {
                              final projectId = int.parse(
                                state.pathParameters['project_id']!,
                              );
                              final reportId = int.tryParse(
                                state.pathParameters['report_id'] ?? '',
                              );
                              final scheduleId = int.tryParse(
                                state.uri.queryParameters['schedule_id'] ?? '',
                              );

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: ReportCategoryScreen(
                                  projectId: projectId,
                                  reportId: reportId,
                                  scheduleId: scheduleId,
                                ),
                              );
                            },
                            routes: [
                              // 2. 신규 작성 (ReportNew) - 다단계 폼 시작점
                              GoRoute(
                                name: RouteNames.reportNew,
                                path: Routes.reportNew,
                                parentNavigatorKey: _projectKey,
                                pageBuilder: (context, state) {
                                  final projectId = int.parse(
                                    state.pathParameters['project_id']!,
                                  );
                                  final scheduleId = int.tryParse(
                                    state.uri.queryParameters['schedule_id'] ??
                                        '',
                                  );

                                  return NoTransitionPage(
                                    key: state.pageKey,
                                    name: state.name,
                                    child: ReportFormScreen(
                                      projectId: projectId,
                                      scheduleId: scheduleId,
                                    ),
                                  );
                                },
                                onExit: (context, state) async {
                                  final error = ref.watch(
                                    errorControllerProvider,
                                  );
                                  final submit = ref.watch(
                                    reportSubmitControllerProvider,
                                  );

                                  if (error is ErrorUnauthorized ||
                                      submit is ReportSubmitCreated ||
                                      submit is ReportSubmitUpdated ||
                                      submit is ReportSubmitDeleted) {
                                    return true;
                                  }

                                  final shouldNavigate = await showDialog<bool>(
                                    context: context,
                                    builder: (context) =>
                                        const PopScopeDialog(),
                                  );
                                  return shouldNavigate ?? false;
                                },
                              ),
                            ],
                          ),
                          GoRoute(
                            name: RouteNames.reportEdit,
                            path: ':report_id/${Routes.reportEdit}',
                            parentNavigatorKey: _projectKey,
                            pageBuilder: (context, state) {
                              final projectId = int.parse(
                                state.pathParameters['project_id']!,
                              );
                              final reportId = int.tryParse(
                                state.pathParameters['report_id'] ?? '',
                              );
                              final scheduleId = int.tryParse(
                                state.uri.queryParameters['schedule_id'] ?? '',
                              );

                              return NoTransitionPage(
                                key: state.pageKey,
                                name: state.name,
                                child: ReportFormScreen(
                                  projectId: projectId,
                                  reportId: reportId,
                                  scheduleId: scheduleId,
                                ),
                              );
                            },
                            onExit: (context, state) async {
                              final error = ref.watch(errorControllerProvider);
                              final submit = ref.watch(
                                reportSubmitControllerProvider,
                              );

                              if (error is ErrorUnauthorized ||
                                  submit is ReportSubmitCreated ||
                                  submit is ReportSubmitUpdated ||
                                  submit is ReportSubmitDeleted) {
                                return true;
                              }

                              final shouldNavigate = await showDialog<bool>(
                                context: context,
                                builder: (context) => const PopScopeDialog(),
                              );
                              return shouldNavigate ?? false;
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
                  final status = state.uri.queryParameters['status'];
                  final sort = state.uri.queryParameters['sort'];
                  final order = state.uri.queryParameters['order'];
                  final search = state.uri.queryParameters['search'];
                  final clients = state.uri.queryParameters['clients'];
                  final categories = state.uri.queryParameters['categories'];
                  final start = state.uri.queryParameters['start'];
                  final end = state.uri.queryParameters['end'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: WorkScreen(
                      view: view,
                      status: status,
                      sort: sort,
                      order: order,
                      search: search,
                      clients: clients,
                      categories: categories,
                      start: start,
                      end: end,
                    ),
                  );
                },
                // routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _scheduleKey,
            routes: [
              GoRoute(
                name: RouteNames.schedule,
                path: Routes.schedule,
                pageBuilder: (context, state) {
                  final view = state.uri.queryParameters['view'];
                  final search = state.uri.queryParameters['search'];
                  final departments = state.uri.queryParameters['departments'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: ScheduleScreen(
                      view: view,
                      search: search,
                      departments: departments,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.scheduleNewChoose,
                    path: Routes.scheduleNewChoose,
                    parentNavigatorKey: _scheduleKey,
                    pageBuilder: (context, state) {
                      final path = state.uri.queryParameters['redirect_to'];
                      final projectId = int.tryParse(
                        state.uri.queryParameters['project_id'] ?? '',
                      );

                      return NoTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: ScheduleCategoryScreen(
                          path: path,
                          projectId: projectId,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: RouteNames.scheduleNew,
                        path: Routes.scheduleNew,
                        pageBuilder: (context, state) {
                          final projectId = int.tryParse(
                            state.uri.queryParameters['project_id'] ?? '',
                          );
                          final categoryId = int.parse(
                            state.uri.queryParameters['category']!,
                          );
                          final scheduleId = int.tryParse(
                            state.pathParameters['schedule_id'] ?? '',
                          );

                          return NoTransitionPage(
                            key: state.pageKey,
                            name: state.name,
                            child: ScheduleFormScreen(
                              projectId: projectId,
                              categoryId: categoryId,
                              scheduleId: scheduleId,
                            ),
                          );
                        },
                        onExit: (context, state) async {
                          final error = ref.watch(errorControllerProvider);
                          final submit = ref.watch(
                            scheduleSubmitControllerProvider,
                          );

                          if (error is ErrorUnauthorized ||
                              submit is ScheduleSubmitCreated ||
                              submit is ScheduleSubmitUpdated ||
                              submit is ScheduleSubmitDeleted) {
                            return true;
                          }

                          final shouldNavigate = await showDialog<bool>(
                            context: context,
                            builder: (context) => const PopScopeDialog(),
                          );
                          return shouldNavigate ?? false;
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    name: RouteNames.scheduleEdit,
                    path: ':schedule_id/${Routes.scheduleEdit}',
                    pageBuilder: (context, state) {
                      final categoryId = int.parse(
                        state.uri.queryParameters['category']!,
                      );
                      final scheduleId = int.tryParse(
                        state.pathParameters['schedule_id'] ?? '',
                      );

                      return NoTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: ScheduleFormScreen(
                          categoryId: categoryId,
                          scheduleId: scheduleId,
                        ),
                      );
                    },
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(
                        scheduleSubmitControllerProvider,
                      );

                      if (error is ErrorUnauthorized ||
                          submit is ScheduleSubmitCreated ||
                          submit is ScheduleSubmitUpdated ||
                          submit is ScheduleSubmitDeleted) {
                        return true;
                      }

                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        builder: (context) => const PopScopeDialog(),
                      );
                      return shouldNavigate ?? false;
                    },
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
                pageBuilder: (context, state) {
                  final folders = state.uri.queryParameters['folders'];
                  final sort = state.uri.queryParameters['sort'];
                  final order = state.uri.queryParameters['order'];
                  final search = state.uri.queryParameters['search'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: DocumentScreen(
                      folders: folders,
                      sort: sort,
                      order: order,
                      search: search,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.documentNew,
                    path: Routes.documentNew,
                    parentNavigatorKey: _key,
                    pageBuilder: (context, state) => buildResponsiveDialogPage(
                      context: context,
                      state: state,
                      child: const DocumentEditDialog(),
                    ),
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(
                        documentSubmitControllerProvider,
                      );

                      if (error is ErrorUnauthorized ||
                          submit is DocumentSubmitDocumentCreated ||
                          submit is DocumentSubmitDocumentUpdated ||
                          submit is DocumentSubmitDocumentDeleted) {
                        return true;
                      }

                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        builder: (context) => const PopScopeDialog(),
                      );
                      return shouldNavigate ?? false;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.documentDetail,
                    path: ':document_id',
                    pageBuilder: (context, state) {
                      final documentId = int.parse(
                        state.pathParameters['document_id']!,
                      );

                      return ClickThroughTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              final curvedAnimation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                                reverseCurve: Curves.easeOut,
                              );

                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(curvedAnimation),
                                child: child,
                              );
                            },
                        child: DocumentDetailScreen(documentId: documentId),
                      );
                    },
                  ),
                  GoRoute(
                    name: RouteNames.documentEdit,
                    path: ':document_id/${Routes.documentEdit}',
                    parentNavigatorKey: _key,
                    pageBuilder: (context, state) {
                      final documentId = int.tryParse(
                        state.pathParameters['document_id'] ?? '',
                      );

                      return buildResponsiveDialogPage(
                        context: context,
                        state: state,
                        child: DocumentEditDialog(documentId: documentId),
                      );
                    },
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(
                        documentSubmitControllerProvider,
                      );

                      if (error is ErrorUnauthorized ||
                          submit is DocumentSubmitDocumentCreated ||
                          submit is DocumentSubmitDocumentUpdated ||
                          submit is DocumentSubmitDocumentDeleted) {
                        return true;
                      }

                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        builder: (context) => const PopScopeDialog(),
                      );
                      return shouldNavigate ?? false;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.documentFolderNew,
                    path: '${Routes.documentFolderBase}/${Routes.documentNew}',
                    parentNavigatorKey: _key,
                    pageBuilder: (context, state) => buildResponsiveDialogPage(
                      context: context,
                      state: state,
                      child: const DocumentFolderEditDialog(),
                    ),
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(
                        documentSubmitControllerProvider,
                      );

                      if (error is ErrorUnauthorized ||
                          submit is DocumentSubmitFolderSuccess) {
                        return true;
                      }

                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        builder: (context) => const PopScopeDialog(),
                      );
                      return shouldNavigate ?? false;
                    },
                  ),
                  GoRoute(
                    name: RouteNames.documentFolderEdit,
                    path:
                        '${Routes.documentFolderBase}/:folder_id/${Routes.documentEdit}',
                    parentNavigatorKey: _key,
                    pageBuilder: (context, state) => buildResponsiveDialogPage(
                      context: context,
                      state: state,
                      child: const DocumentFolderEditDialog(),
                    ),
                    onExit: (context, state) async {
                      final error = ref.watch(errorControllerProvider);
                      final submit = ref.watch(
                        documentSubmitControllerProvider,
                      );

                      if (error is ErrorUnauthorized ||
                          submit is DocumentSubmitFolderSuccess) {
                        return true;
                      }

                      final shouldNavigate = await showDialog<bool>(
                        context: context,
                        builder: (context) => const PopScopeDialog(),
                      );
                      return shouldNavigate ?? false;
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _organizationKey,
            routes: [
              GoRoute(
                name: RouteNames.organization,
                path: Routes.organization,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: OrganizationScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _dataKey,
            routes: [
              GoRoute(
                name: RouteNames.data,
                path: Routes.data,
                redirect: (context, state) async {
                  final auth = ref.read(authControllerProvider);
                  if (auth is AuthAuthenticated && !auth.user.isAdmin) {
                    return _showWrongApproachAndGoDashboard(context);
                  }
                  return null;
                },
                pageBuilder: (context, state) {
                  final view = state.uri.queryParameters['view'];
                  final search = state.uri.queryParameters['search'];
                  final departments = state.uri.queryParameters['departments'];
                  final positionId = int.tryParse(
                    state.uri.queryParameters['position_id'] ?? '',
                  );

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: DataScreen(
                      view: view,
                      search: search,
                      departments: departments,
                      positionId: positionId,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.supplierNew,
                    path: '${Routes.supplierBase}/${Routes.supplierNew}',
                    parentNavigatorKey: _key,
                    pageBuilder: (context, state) => DialogPage(
                      key: state.pageKey,
                      name: state.name,
                      builder: (_) => const SupplierEditDialog(),
                    ),
                  ),
                  GoRoute(
                    name: RouteNames.supplierEdit,
                    path:
                        '${Routes.supplierBase}/:supplier_id/${Routes.supplierEdit}',
                    parentNavigatorKey: _key,
                    pageBuilder: (context, state) {
                      final supplierId = int.tryParse(
                        state.pathParameters['supplier_id'] ?? '',
                      );

                      return DialogPage(
                        key: state.pageKey,
                        name: state.name,
                        builder: (_) =>
                            SupplierEditDialog(supplierId: supplierId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _analyticsKey,
            routes: [
              GoRoute(
                name: RouteNames.analytics,
                path: Routes.analytics,
                redirect: (context, state) async {
                  final auth = ref.read(authControllerProvider);
                  if (auth is AuthAuthenticated && !auth.user.isAdmin) {
                    return _showWrongApproachAndGoDashboard(context);
                  }
                  return null;
                },
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: AnalyticsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _accountKey,
            routes: [
              GoRoute(
                name: RouteNames.account,
                path: Routes.account,
                pageBuilder: (context, state) {
                  final view = state.uri.queryParameters['view'];

                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: AccountScreen(view: view),
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

extension StatefulNavigationShellExtension on StatefulNavigationShell {
  String get currentRouteName {
    RouteMatchBase match = shellRouteContext.match.matches.last;

    while (match is ShellRouteMatch && match.matches.isNotEmpty) {
      match = match.matches.last;
    }

    final route = match.route;
    return route is GoRoute ? route.name ?? '' : '';
  }
}

extension RouterBuildContextExtension on BuildContext {
  Map<String, String> buildQueryParameters({
    required Map<String, String?> updates,
    Iterable<String> remove = const [],
  }) {
    final queryParameters = {...GoRouterState.of(this).uri.queryParameters};

    for (final key in remove) {
      queryParameters.remove(key);
    }

    for (final MapEntry(:key, :value) in updates.entries) {
      if (value == null || value.isEmpty) {
        queryParameters.remove(key);
      } else {
        queryParameters[key] = value;
      }
    }

    return queryParameters;
  }
}
