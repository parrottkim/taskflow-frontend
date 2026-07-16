import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_preview_panel.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class DocumentDetailScreen extends ConsumerWidget {
  final int documentId;

  const DocumentDetailScreen({super.key, required this.documentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void close() {
      context.pop();
    }

    ref.listen(documentSubmitControllerProvider, (_, state) {
      if (state is DocumentSubmitDocumentDeleted) close();
    });

    final detail = ref.watch(
      documentDetailControllerProvider(documentId: documentId),
    );

    return Responsive(
      desktop: LayoutBuilder(
        builder: (context, constraints) => Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: (constraints.maxWidth * 0.55).clamp(560.0, 760.0),
            height: double.infinity,
            child: _DetailWidget(detail: detail, onClose: close),
          ),
        ),
      ),
      mobile: BranchLayout(
        child: _DetailWidget(detail: detail, onClose: close, fullScreen: true),
      ),
    );
  }
}

class _DetailWidget extends StatelessWidget {
  final AsyncValue<DocumentDetailState> detail;
  final VoidCallback onClose;
  final bool fullScreen;

  const _DetailWidget({
    required this.detail,
    required this.onClose,
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return switch (detail) {
      AsyncData(:final value) => DocumentPreviewPanel(
        document: value.document,
        onClose: onClose,
        fullScreen: fullScreen,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: DocumentPreviewPanel(
          document: Document.dummy(),
          onClose: onClose,
          fullScreen: fullScreen,
        ),
      ),
    };
  }
}
