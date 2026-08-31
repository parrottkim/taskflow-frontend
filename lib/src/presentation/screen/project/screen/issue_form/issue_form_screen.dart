import 'dart:async';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/issue_form_actions.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/issue_form_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class IssueFormScreen extends ConsumerWidget {
  final int projectId;
  final int categoryId;
  final int? issueId;

  const IssueFormScreen({
    super.key,
    required this.projectId,
    required this.categoryId,
    this.issueId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      issueFormControllerProvider(
        projectId: projectId,
        categoryId: categoryId,
        issueId: issueId,
      ),
    );

    return switch (form) {
      AsyncData(:final value) => _IssueFormView(
        key: const ValueKey('issue-form-loaded'),
        projectId: projectId,
        categoryId: categoryId,
        issueId: issueId,
        value: value,
      ),
      AsyncError(:final error, :final stackTrace) => BranchLayout(
        child: ErrorStateView(error: error, stackTrace: stackTrace),
      ),
      _ => Skeletonizer(
        child: _IssueFormView(
          key: const ValueKey('issue-form-skeleton'),
          projectId: projectId,
          categoryId: categoryId,
          issueId: issueId,
          value: IssueFormState(
            category: IssueCategory.dummy(),
            contractItems: [],
            procurementItems: [],
            transactionItems: [],
          ),
        ),
      ),
    };
  }
}

class _IssueFormView extends ConsumerStatefulWidget {
  final int projectId;
  final int categoryId;
  final int? issueId;
  final IssueFormState value;

  const _IssueFormView({
    super.key,
    required this.projectId,
    required this.categoryId,
    this.issueId,
    required this.value,
  });

  @override
  ConsumerState<_IssueFormView> createState() => _IssueFormViewState();
}

class _IssueFormViewState extends ConsumerState<_IssueFormView> {
  late EditorState _editorState;
  late final AppLifecycleListener _appLifecycleListener;

  IssueFormController get _formController => ref.read(
    issueFormControllerProvider(
      projectId: widget.projectId,
      categoryId: widget.categoryId,
      issueId: widget.issueId,
    ).notifier,
  );

  IssueDraftAutosaveController get _draftAutosaveController => ref.read(
    issueDraftAutosaveControllerProvider(
      projectId: widget.projectId,
      categoryId: widget.categoryId,
      issueId: widget.issueId,
    ).notifier,
  );

  @override
  void initState() {
    super.initState();
    _editorState = _createEditorState(widget.value.content);
    _appLifecycleListener = AppLifecycleListener(
      onInactive: _flushDraft,
      onPause: _flushDraft,
      onHide: _flushDraft,
    );
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    _editorState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = issueFormControllerProvider(
      projectId: widget.projectId,
      categoryId: widget.categoryId,
      issueId: widget.issueId,
    );
    final draftAutosaveProvider = issueDraftAutosaveControllerProvider(
      projectId: widget.projectId,
      categoryId: widget.categoryId,
      issueId: widget.issueId,
    );

    ref.listen(draftAutosaveProvider, (_, next) {
      if (next is! ReportDraftAutosaveSaved) return;

      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              type: ToastType.saving,
              message: Intl.message('draft_saving'),
            ),
          );
    });

    ref.listen<AsyncValue<IssueFormState>>(formProvider, (previous, next) {
      if (previous == null || !previous.hasValue || !next.hasValue) return;
      if (previous.requireValue == next.requireValue) return;

      ref.read(draftAutosaveProvider.notifier).schedule();
    });

    ref.listen<IssueSubmitState>(
      issueSubmitControllerProvider,
      (_, state) => unawaited(_handleSubmitState(state)),
    );

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) _flushDraft();
      },
      child: BranchLayout(
        onTap: _goBack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: IssueFormScope(
                projectId: widget.projectId,
                categoryId: widget.categoryId,
                issueId: widget.issueId,
                child: IssueFormWidget(
                  value: widget.value,
                  editorState: _editorState,
                  onDraftSelected: _selectDraft,
                ),
              ),
            ),
            IssueFormActions(
              label: widget.issueId == null
                  ? Intl.message('common_post')
                  : Intl.message('common_edit'),
              onPressed: _submit,
              onDelete: widget.issueId == null ? null : _deleteIssue,
            ),
          ],
        ),
      ),
    );
  }

  EditorState _createEditorState(String? content) {
    return content == null || content.isEmpty
        ? EditorState.blank(withInitialText: true)
        : EditorState(document: markdownToDocument(content));
  }

  void _flushDraft() {
    unawaited(_draftAutosaveController.flush());
  }

  Future<void> _goBack() async {
    await _draftAutosaveController.flush();
    if (!mounted) return;

    context.pop();
  }

  Future<void> _selectDraft(String draftId) async {
    await _draftAutosaveController.flush();
    if (!mounted) return;

    final restored = await ref
        .read(draftRestoreControllerProvider.notifier)
        .restoreIssue(draftId: draftId, projectId: widget.projectId);
    if (!mounted) return;

    if (restored == null) {
      if (ref.read(draftRestoreControllerProvider) is DraftRestoreInvalid) {
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.alert,
                message: Intl.message('draft_restore_failed'),
              ),
            );
      }
      return;
    }

    ref.read(issueValidationControllerProvider.notifier).reset();
    _formController.restoreDraftPayload(
      restored.payload,
      files: restored.files,
    );

    final previousEditorState = _editorState;
    setState(() => _editorState = _createEditorState(restored.payload.content));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      previousEditorState.dispose();
    });
  }

  Future<void> _submit() async {
    final isValid = ref
        .read(issueValidationControllerProvider.notifier)
        .validate(
          value: widget.value,
          contentIsEmpty: _editorState.document.isEmpty,
        );
    if (!isValid) return;

    await _draftAutosaveController.flush();
    if (!mounted) return;

    final submitController = ref.read(issueSubmitControllerProvider.notifier);
    if (widget.issueId == null) {
      await submitController.createIssue(
        projectId: widget.projectId,
        categoryId: widget.categoryId,
        editorState: _editorState,
      );
    } else {
      await submitController.updateIssue(
        projectId: widget.projectId,
        categoryId: widget.categoryId,
        issueId: widget.issueId!,
        editorState: _editorState,
      );
    }
  }

  Future<void> _deleteIssue() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (_) => DeleteDialog(
        title: Intl.message('issue_form_delete_dialog_1'),
        content: Intl.message('issue_form_delete_dialog_2'),
      ),
    );
    if (!mounted || shouldDelete != true) return;

    await ref
        .read(issueSubmitControllerProvider.notifier)
        .deleteIssue(projectId: widget.projectId, issueId: widget.issueId!);
  }

  Future<void> _handleSubmitState(IssueSubmitState state) async {
    if (state is IssueSubmitPending) {
      LoadingOverlay.show(context);
      return;
    }

    LoadingOverlay.hide();

    if (state is IssueSubmitCreated ||
        state is IssueSubmitUpdated ||
        state is IssueSubmitDeleted) {
      try {
        await ref
            .read(
              issueDraftControllerProvider(
                projectId: widget.projectId,
              ).notifier,
            )
            .deleteCurrent();
      } catch (error, stackTrace) {
        debugPrint('Issue draft cleanup failed: $error');
        debugPrintStack(stackTrace: stackTrace);
      }
      if (!mounted) return;
    }

    switch (state) {
      case IssueSubmitCreated(:final issue) || IssueSubmitUpdated(:final issue):
        final isCreated = state is IssueSubmitCreated;
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.verified,
                message: Intl.message(
                  isCreated ? 'issue_form_created' : 'issue_form_updated',
                ),
              ),
            );
        context.goNamed(
          RouteNames.projectDetail,
          pathParameters: {'project_id': widget.projectId.toString()},
          queryParameters: {
            'view': switch (widget.value.category) {
              IssueProcurement() => 'procurement',
              IssueApproval() => 'approval',
              _ => 'contract',
            },
            'issue': issue.id.toString(),
          },
        );
      case IssueSubmitDeleted():
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.standard,
                message: Intl.message('issue_form_deleted'),
              ),
            );
        context.goNamed(
          RouteNames.projectDetail,
          pathParameters: {'project_id': widget.projectId.toString()},
        );
      default:
        break;
    }
  }
}
