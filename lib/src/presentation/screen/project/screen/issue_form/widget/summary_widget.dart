import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/issue_draft_recovery_widget.dart';

class SummaryWidget extends StatelessWidget {
  final ValueChanged<String> onDraftSelected;

  const SummaryWidget({super.key, required this.onDraftSelected});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 320.0, maxWidth: 320.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [IssueDraftRecoveryWidget(onSelected: onDraftSelected)],
        ),
      ),
    );
  }
}
