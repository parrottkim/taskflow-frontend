import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SummaryWidget extends HookConsumerWidget {
  final Project project;

  const SummaryWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (project.isClosed) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [project]);

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 320.0, maxWidth: 320.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: sizeController,
              curve: Curves.easeInQuad,
            ),
            child: FadeTransition(
              opacity: opacityController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ContentContainer(
                  color: colorScheme.outline.subtle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Symbols.mountain_flag_rounded, size: 20.0),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Intl.message('project_detail_closed_1'),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4.0),
                            Text(Intl.message('project_detail_closed_2')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (project.isClosed)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ContentContainer(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intl.message('project_detail_summary_2'),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      project.closureMessage!,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.strong,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ContentContainer(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intl.message('project_detail_summary_1'),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                UserInfo.compact(user: project.createdBy),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
