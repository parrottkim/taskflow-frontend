import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project_form/widget/client_selector_widget.dart';
import 'package:taskflow/src/presentation/screen/project_form/widget/manager_selector_widget.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ProjectFormScreen extends ConsumerWidget {
  final int? projectId;

  const ProjectFormScreen({
    super.key,
    this.projectId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(projectFormControllerProvider(projectId: projectId));

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(
            projectId: projectId,
            value: value,
          ),
        AsyncError(:final error, :final stackTrace) =>
          ErrorContainerWidget(error: error, stackTrace: stackTrace),
        _ => Skeletonizer(
            ignoreContainers: true,
            child: _DesktopWidget(
              value: ProjectFormState(),
            ),
          ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int? projectId;
  final ProjectFormState value;

  const _DesktopWidget({
    this.projectId,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    final codeController = useTextEditingController(text: value.code);
    final nameController = useTextEditingController(text: value.name);

    final code =
        useListenableSelector(codeController, () => codeController.text);
    final name =
        useListenableSelector(nameController, () => nameController.text);

    final isClientsEmpty = useState<bool>(false);
    final isCodeEmpty = useState<bool>(false);
    final isNameEmpty = useState<bool>(false);

    ref.listen(projectSubmitControllerProvider, (_, state) {
      if (state is ProjectSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ProjectSubmitSuccess) {
          context.goNamed(RouteNames.projectDetail,
              pathParameters: {'project_id': state.project.id.toString()});
        }
        if (state is ProjectSubmitDeleted) {
          context.goNamed(RouteNames.project);
        }
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            constraints: BoxConstraints(maxWidth: 430.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intl.message('project_form_clients'),
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                ClientSelectorWidget(
                  projectId: projectId,
                  clients: value.clients,
                  isClientsEmpty: isClientsEmpty,
                ),
                InvalidWidget(
                  visible: isClientsEmpty.value,
                  text: Intl.message('project_form_invalid_1'),
                ),
                SizedBox(height: 24.0),
                Text(
                  Intl.message('project_form_code'),
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Skeleton.keep(
                        child: TextField(
                          controller: codeController,
                          onChanged: (value) {
                            isCodeEmpty.value = false;

                            ref
                                .read(projectFormControllerProvider(
                                        projectId: projectId)
                                    .notifier)
                                .setCode(code: value);
                          },
                          decoration: InputDecoration(filled: true),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        final identifier = generateRandomIdentifier();
                        codeController.text = identifier;
                        ref
                            .read(projectFormControllerProvider(
                                    projectId: projectId)
                                .notifier)
                            .setCode(code: identifier);
                      },
                      icon: Icon(Symbols.glyphs_rounded),
                      label: Text(
                        Intl.message('project_form_code_random'),
                      ),
                    ),
                  ],
                ),
                InvalidWidget(
                  visible: isCodeEmpty.value,
                  text: Intl.message('project_form_invalid_2'),
                ),
                SizedBox(height: 24.0),
                Text(
                  Intl.message('project_form_name'),
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                Skeleton.keep(
                  child: TextField(
                    controller: nameController,
                    onChanged: (value) {
                      isNameEmpty.value = false;

                      ref
                          .read(projectFormControllerProvider(
                                  projectId: projectId)
                              .notifier)
                          .setName(name: value);
                    },
                    decoration: InputDecoration(filled: true),
                  ),
                ),
                InvalidWidget(
                  visible: isNameEmpty.value,
                  text: Intl.message('project_form_invalid_3'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Divider(),
                ),
                Text(
                  Intl.message('project_form_optional'),
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 24.0),
                Text(
                  Intl.message('project_form_user'),
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                ManagerSelectorWidget(
                    projectId: projectId, selectedManager: value.manager),
                SizedBox(height: 24.0),
                if (auth is AuthAuthenticated && auth.user.isAdmin)
                  Row(
                    children: [
                      CustomToggleButton(
                        value: value.isPreexecuted,
                        onChanged: !value.isContracted
                            ? (value) {
                                ref
                                    .read(projectFormControllerProvider(
                                            projectId: projectId)
                                        .notifier)
                                    .setIsPreexecuted(
                                        isPreexecuted: value ?? false);
                              }
                            : null,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        Intl.message('project_form_preexecuted'),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 4.0),
                      TooltipOverlay(
                        message:
                            Text(Intl.message('project_form_preexecuted_info')),
                        child: Icon(
                          Symbols.info_rounded,
                          size: 18.0,
                          color: colorScheme.outline.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        Container(
          padding:
              EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
          constraints: BoxConstraints(maxWidth: 430.0),
          child: Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () async {
                    isClientsEmpty.value = !value.isAllClientSelected;
                    isCodeEmpty.value = code.isEmpty;
                    isNameEmpty.value = name.isEmpty;

                    if (isClientsEmpty.value ||
                        isCodeEmpty.value ||
                        isNameEmpty.value) {
                      return;
                    }

                    if (projectId == null) {
                      await ref
                          .read(projectSubmitControllerProvider.notifier)
                          .createProject();
                    } else {
                      await ref
                          .read(projectSubmitControllerProvider.notifier)
                          .updateProject(projectId: projectId!);
                    }
                  },
                  child: Text(
                    projectId != null
                        ? Intl.message('common_edit')
                        : Intl.message('common_post'),
                  ),
                ),
              ),
              if (projectId != null)
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FilledButton(
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (_) => DeleteDialog(
                          title: Intl.message('project_form_delete_dialog_1'),
                          content: Intl.message('project_form_delete_dialog_2'),
                        ),
                      );

                      if (result) {
                        context.pop();

                        await ref
                            .read(projectFormControllerProvider(
                                    projectId: projectId)
                                .notifier)
                            .deleteProject();

                        ref.read(toastProvider).showToast(
                              child: Toast(
                                type: ToastType.standard,
                                message: Intl.message('project_form_delete'),
                              ),
                            );
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      iconColor: colorScheme.onError,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(
                        Symbols.delete_rounded,
                        size: 19.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
