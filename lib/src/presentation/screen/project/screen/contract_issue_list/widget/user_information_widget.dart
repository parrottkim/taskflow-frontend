import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class UserInformationWidget extends StatelessWidget {
  final User item;

  const UserInformationWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Skeleton.unite(
              child: CircleAvatar(
                backgroundColor: Functions(
                  context,
                ).generateColorFromId(item.id),
                radius: 10.0,
                child: Text(
                  getInitials(item.username),
                  style: const TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ),
            ),
          ),
        Text(
          item.username,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 12.0),
        if (Responsive.isDesktop(context))
          Text.rich(
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            TextSpan(
              children: [
                TextSpan(text: item.email),
                if (item.department != null)
                  TextSpan(text: ' • ${item.department!.name}'),
              ],
            ),
          ),
      ],
    );
  }
}
