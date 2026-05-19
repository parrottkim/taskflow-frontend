import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/supplier_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SupplierSearchDialog extends HookConsumerWidget {
  final int projectId;
  final int categoryId;
  final int? issueId;
  final int itemIndex;

  const SupplierSearchDialog({
    super.key,
    required this.projectId,
    required this.categoryId,
    this.issueId,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final search = ref.watch(supplierSearchControllerProvider);

    final controller = useTextEditingController();

    useListenable(controller);

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    ref.listen(supplierSearchControllerProvider, (_, state) {
      if (state is SupplierSearchWaiting ||
          state is SupplierSearchResult ||
          state is SupplierSearchFailure) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
    });

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: BoxConstraints(maxWidth: 430.0, maxHeight: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: Intl.message('issue_form_procurement_12'),
                contentPadding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 14.0),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onChanged: (value) => ref
                  .read(supplierSearchControllerProvider.notifier)
                  .search(search: value),
            ),
            Divider(),
            SizeTransition(
              sizeFactor: sizeController,
              child: FadeTransition(
                opacity: opacityController,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: switch (search) {
                    SupplierSearchWaiting(:final search) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text.rich(
                            style: textTheme.bodyMedium,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: search,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                TextSpan(text: ' '),
                                TextSpan(
                                  text: Intl.message(
                                    'issue_form_procurement_16',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SupplierSearchResult(:final items) => SupplierListWidget(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                      itemIndex: itemIndex,
                      items: items,
                    ),
                    SupplierSearchFailure(:final message) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                    _ => SizedBox(),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
