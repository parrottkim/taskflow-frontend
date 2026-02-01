import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mime/mime.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/progress_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_form_section.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';

class ReportFormScreen extends HookConsumerWidget {
  const ReportFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final reportId = int.tryParse(state.pathParameters['report_id'] ?? '');
    final scheduleId = int.tryParse(
      state.uri.queryParameters['schedule_id'] ?? '',
    );

    final form = ref.watch(
      reportFormControllerProvider(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
      ),
    );

    return switch (form) {
      AsyncData(:final value) => _DesktopWidget(value: value),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          value: ReportFormState(schedule: Schedule.dummy()),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final ReportFormState value;

  const _DesktopWidget({required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final reportId = int.tryParse(state.pathParameters['report_id'] ?? '');
    final scheduleId = int.tryParse(
      state.uri.queryParameters['schedule_id'] ?? '',
    );

    final colorScheme = Theme.of(context).colorScheme;

    // trip이 있으면 6개, 없으면 1개 스텝
    final steps =
        value.schedule != null &&
            (value.schedule!.category is ScheduleDomestic ||
                value.schedule!.category is ScheduleOverseas)
        ? [
            'transportation',
            'local_transportation',
            'accommodation',
            'daily_expense',
            'other',
            'description',
          ]
        : ['description'];

    final currentIndex = useState(0);
    final currentStep = steps[currentIndex.value];
    final isLastStep = currentIndex.value == steps.length - 1;

    final editorState = useMemoized(() {
      return value.content == null
          ? EditorState.blank(withInitialText: true)
          : EditorState(document: markdownToDocument(value.content!));
    }, []);

    ref.listen(reportSubmitControllerProvider, (_, state) {
      if (state is ReportSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ReportSubmitSuccess) {
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
            queryParameters: {
              'view': 'report',
              'report': state.report.id.toString(),
            },
          );
        }

        if (state is ReportSubmitDeleted) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('report_form_delete'),
                ),
              );
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
          );
        }
      }
    });

    Future<void> serializeAndSetContent() async {
      final document = editorState.document;
      final Map<Node, MultipartFile> map = {};
      final imageNodes = <Node>[];

      // 1. 문서의 모든 노드를 순회하여 이미지 노드 찾기
      void traverseNodes(Node node) {
        if (node.type == ImageBlockKeys.type) {
          final imageUrl = node.attributes[ImageBlockKeys.url] as String?;
          if (imageUrl != null) {
            imageNodes.add(node);
          }
        }

        // 자식 노드 순회
        for (final child in node.children) {
          traverseNodes(child);
        }
      }

      // 루트 노드부터 순회 시작
      for (final node in document.root.children) {
        traverseNodes(node);
      }

      // 2. base64 이미지 추출 및 파일 생성
      for (final node in imageNodes) {
        try {
          final imageUrl = node.attributes[ImageBlockKeys.url] as String;
          final base64 = imageUrl.split(',').last;
          final bytes = base64Decode(base64);
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';

          final extension = extensionFromMime(mimeType) ?? 'jpeg';
          final filename = '${node.id}.$extension';

          final multipartFile = MultipartFile.fromBytes(
            bytes,
            filename: filename,
            contentType: MediaType.parse(mimeType),
          );

          map[node] = multipartFile;
        } catch (e) {
          print('Image processing failed for node: ${node.id}, error: $e');
        }
      }

      // 3. 이미지 파일 일괄 업로드
      final files = map.values.toList();

      if (files.isNotEmpty) {
        try {
          final uploadResults = await ref
              .read(sftpRepositoryProvider)
              .uploadInlineImage(path: 'report', files: files);

          // 4. 업로드된 URL로 노드 업데이트
          final originalNodes = map.keys.toList();

          for (
            int i = 0;
            i < uploadResults.length && i < originalNodes.length;
            i++
          ) {
            final originalNode = originalNodes[i];
            final uploadedUrl = uploadResults[i].url;

            // AppflowY Editor에서 노드의 attributes 업데이트
            originalNode.updateAttributes({ImageBlockKeys.url: uploadedUrl});
          }
        } catch (e) {
          print('Batch image upload failed, error: $e');
        }
      }

      // 5. 최종 문서를 Markdown으로 직렬화
      final markdown = documentToMarkdown(document);

      // 6. Controller에 최종 content 전달
      ref
          .read(
            reportFormControllerProvider(
              projectId: projectId,
              reportId: reportId,
              scheduleId: scheduleId,
            ).notifier,
          )
          .setContent(markdown);
    }

    return BranchLayout(
      title: Text(
        Intl.message(
          value.schedule == null ||
                  value.schedule is! ScheduleDomestic ||
                  value.schedule is! ScheduleOverseas
              ? 'report_form_title'
              : 'report_form_title_${value.schedule!.category.id}',
        ),
      ),
      onTap: () {
        if (steps.length > 1 && isLastStep) {
          if (ref.watch(reportValidationControllerProvider).contentInvalid) {
            return;
          }
        }
        if (currentIndex.value > 0) {
          final isAllValid = ref
              .read(reportValidationControllerProvider.notifier)
              .isValid();

          if (!isAllValid) {
            return;
          }

          currentIndex.value = currentIndex.value - 1;
        } else {
          context.pop();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (value.schedule != null &&
                    (value.schedule!.category is ScheduleDomestic ||
                        value.schedule!.category is ScheduleOverseas))
                  ProgressWidget(
                    currentIndex: currentIndex.value,
                    steps: steps,
                  ),
                Expanded(
                  child: ReportFormSection(
                    step: currentStep,
                    value: value,
                    editorState: editorState,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 16.0,
              bottom: 32.0,
            ),
            constraints: BoxConstraints(maxWidth: 430.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      // Update validation status from current form data
                      ref
                          .read(reportValidationControllerProvider.notifier)
                          .updateAllValidationStatus(
                            projectId: projectId,
                            reportId: reportId,
                            scheduleId: scheduleId,
                          );

                      // If validation fails, navigate to the first invalid step (if available)
                      final isAllValid = ref
                          .read(reportValidationControllerProvider.notifier)
                          .isValid();

                      if (!isAllValid) {
                        return;
                      }

                      // All valid — proceed to next step or submit
                      if (isLastStep) {
                        await serializeAndSetContent();

                        if (ref
                            .watch(reportValidationControllerProvider)
                            .contentInvalid) {
                          return;
                        }

                        if (reportId == null) {
                          ref
                              .read(reportSubmitControllerProvider.notifier)
                              .createReport(projectId: projectId);
                          return;
                        } else {
                          ref
                              .read(reportSubmitControllerProvider.notifier)
                              .updateReport(
                                projectId: projectId,
                                reportId: reportId!,
                              );
                          return;
                        }
                      } else {
                        // 다음 단계로 이동
                        currentIndex.value = currentIndex.value + 1;
                      }

                      // Additional per-step checks (legacy/extra guards)
                      // final form = await ref.watch(
                      //     reportFormControllerProvider(
                      //             projectId: projectId, reportId: reportId)
                      //         .future);

                      // if (step == 'transportation') {
                      //   if (form.expenses.any((item) =>
                      //       item.price == null || item.price!.isEmpty)) {
                      //     return;
                      //   }
                      // }
                      // if (step == 'local_transportation') {
                      //   if (form.expenses.any((item) =>
                      //       item.price == null || item.price!.isEmpty)) {
                      //     return;
                      //   }
                      // }
                    },
                    child: Text(
                      isLastStep
                          ? reportId == null
                                ? Intl.message('common_post')
                                : Intl.message('common_edit')
                          : Intl.message('common_next'),
                    ),
                  ),
                ),
                if (reportId != null)
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FilledButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            title: Intl.message('report_form_delete_dialog_1'),
                            content: Intl.message(
                              'report_form_delete_dialog_2',
                            ),
                          ),
                        );

                        if (result) {
                          await ref
                              .read(reportSubmitControllerProvider.notifier)
                              .deleteReport(
                                projectId: projectId,
                                reportId: reportId!,
                              );
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        iconColor: colorScheme.onError,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(Symbols.delete_rounded, size: 19.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
