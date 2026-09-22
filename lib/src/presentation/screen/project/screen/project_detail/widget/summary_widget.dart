import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/project_cost_summary_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/project_participant_summary_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SummaryWidget extends HookWidget {
  final Project project;
  final ProjectParticipantSummary participantSummary;
  final ProjectCostSummary costSummary;

  const SummaryWidget({
    super.key,
    required this.project,
    required this.participantSummary,
    required this.costSummary,
  });

  @override
  Widget build(BuildContext context) {
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
      constraints: const BoxConstraints(minWidth: 320.0, maxWidth: 320.0),
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
                      const Icon(Symbols.mountain_flag_rounded, size: 20.0),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Intl.message('project_closed_title'),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(Intl.message('project_closed_description')),
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intl.message('project_detail_summary_2'),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8.0),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intl.message('project_detail_summary_1'),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8.0),
                UserInfo.compact(user: project.createdBy),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ProjectParticipantSummaryWidget(
              project: project,
              participantSummary: participantSummary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ProjectCostSummaryWidget(costSummary: costSummary),
          ),
        ],
      ),
    );
  }
}
