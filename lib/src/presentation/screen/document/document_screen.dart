import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_list_widget.dart';
import 'package:taskflow/src/presentation/screen/document/widget/folder_tree_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class DocumentScreen extends HookConsumerWidget {
  final String? folders;
  final String? sort;
  final String? order;
  final String? search;

  const DocumentScreen({
    super.key,
    this.folders,
    this.sort,
    this.order,
    this.search,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(documentSubmitControllerProvider, (_, state) {
      if (state is DocumentSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (state) {
        case DocumentSubmitDocumentCreated() || DocumentSubmitDocumentUpdated():
          final isCreated = state is DocumentSubmitDocumentCreated;

          context.pop();
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message(
                    isCreated ? 'document_created' : 'document_updated',
                  ),
                ),
              );

        case DocumentSubmitFolderSuccess():
          context.pop();
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message('document_folder_success'),
                ),
              );

        case DocumentSubmitDocumentDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('data_supplier_deleted'),
                ),
              );

        default:
          break;
      }
    });

    useEffect(() {
      final location = GoRouter.of(context).location();

      if (!location.startsWith(Routes.document)) return;

      Future.microtask(() {
        ref
            .read(documentFilterControllerProvider.notifier)
            .init(folders: folders, sort: sort, order: order, search: search);
      });

      return null;
    }, [folders, sort, order, search]);

    return BranchLayout(
      child: Responsive(desktop: _DesktopWidget(), mobile: _MobileWidget()),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Divider(),
          Expanded(
            child: Row(
              children: [
                FolderTreeWidget(),
                VerticalDivider(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.0),
                      DocumentFilterWidget(),
                      SizedBox(height: 8.0),
                      DocumentListWidget(),
                    ],
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

class _MobileWidget extends StatelessWidget {
  const _MobileWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FolderTreeWidget(),
        SizedBox(height: 16.0),
        DocumentFilterWidget(),
        SizedBox(height: 8.0),
        DocumentListWidget(),
      ],
    );
  }
}
