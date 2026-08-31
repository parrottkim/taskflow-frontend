import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class OrganizationScreen extends ConsumerWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final organization = ref.watch(organizationProvider);

    return BranchLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ContentContainer(
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(8.0),
                child: switch (organization) {
                  AsyncData(:final value) => _OrganizationChart(state: value),
                  AsyncError(:final error, :final stackTrace) => ErrorStateView(
                    error: error,
                    stackTrace: stackTrace,
                  ),
                  _ => Skeletonizer(
                    child: _OrganizationChart(
                      state: OrganizationState(
                        departmentGroups: [
                          UserDepartmentGroup(
                            depth: 0,
                            items: List.generate(
                              3,
                              (index) => UserDepartment(
                                id: index + 1,
                                name: 'Department',
                              ),
                            ),
                          ),
                        ],
                        departmentItems: List.generate(
                          3,
                          (index) =>
                              UserDepartment(id: index + 1, name: 'Department'),
                        ),
                        users: List.filled(9, User.dummy()),
                      ),
                    ),
                  ),
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OrganizationChart extends StatelessWidget {
  final OrganizationState state;

  const _OrganizationChart({required this.state});

  @override
  Widget build(BuildContext context) {
    final rootDepartments = _childDepartments(parentId: null, depth: 0);
    final usersByDepartment = _usersByDepartment();
    final unassignedUsers = usersByDepartment[null] ?? const <User>[];

    if (state.departmentGroups.isEmpty && state.users.isEmpty) {
      return _EmptyOrganization();
    }

    if (rootDepartments.isEmpty && unassignedUsers.isEmpty) {
      return _EmptyOrganization();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final department in rootDepartments) ...[
                    _DepartmentNode(
                      department: department,
                      depth: 0,
                      usersByDepartment: usersByDepartment,
                      childDepartments: _childDepartments,
                    ),
                    if (department != rootDepartments.last)
                      const SizedBox(width: 40.0),
                  ],
                  if (unassignedUsers.isNotEmpty)
                    _DepartmentNode(
                      department: UserDepartment(
                        id: -1,
                        name: Intl.message('unspecified'),
                      ),
                      depth: 0,
                      usersByDepartment: {-1: unassignedUsers},
                      childDepartments: ({required parentId, required depth}) =>
                          const [],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Map<int?, List<User>> _usersByDepartment() {
    final usersByDepartment = <int?, List<User>>{};

    for (final user in state.users) {
      final departmentId = user.department?.id;
      usersByDepartment.putIfAbsent(departmentId, () => []).add(user);
    }

    return usersByDepartment;
  }

  List<UserDepartment> _childDepartments({
    required int? parentId,
    required int depth,
  }) {
    if (state.departmentGroups.isEmpty) {
      return parentId == null && depth == 0 ? state.departmentItems : const [];
    }

    return state.departmentGroups
        .where((group) => group.depth == depth && group.parentId == parentId)
        .expand((group) => group.items)
        .toList();
  }
}

class _DepartmentNode extends StatelessWidget {
  static const double _nodeWidth = 240.0;
  static const double _siblingSpacing = 16.0;
  static const double _connectorHeight = 18.0;

  final UserDepartment department;
  final int depth;
  final Map<int?, List<User>> usersByDepartment;
  final List<UserDepartment> Function({
    required int? parentId,
    required int depth,
  })
  childDepartments;

  const _DepartmentNode({
    required this.department,
    required this.depth,
    required this.usersByDepartment,
    required this.childDepartments,
  });

  @override
  Widget build(BuildContext context) {
    final users = usersByDepartment[department.id] ?? const <User>[];
    final children = childDepartments(
      parentId: department.id,
      depth: depth + 1,
    );
    final childWidths = [
      for (final child in children) _subtreeWidth(child, depth + 1),
    ];
    final childrenWidth = _childrenWidth(childWidths);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: _nodeWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DepartmentHeader(
                department: department,
                depth: depth,
                userCount: users.length,
              ),
              SizedBox(height: 8.0),
              for (final user in users) ...[
                _UserTile(user: user),
                if (user != users.last) const SizedBox(height: 6.0),
              ],
            ],
          ),
        ),
        if (children.isNotEmpty) ...[
          SizedBox(
            width: childrenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (children.length > 1)
                  _ChildrenConnector(
                    childWidths: childWidths,
                    spacing: _siblingSpacing,
                    height: _connectorHeight,
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(children.length, (index) {
                    final child = children[index];

                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == children.length - 1
                            ? 0.0
                            : _siblingSpacing,
                      ),
                      child: SizedBox(
                        width: childWidths[index],
                        child: _DepartmentNode(
                          department: child,
                          depth: depth + 1,
                          usersByDepartment: usersByDepartment,
                          childDepartments: childDepartments,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  double _subtreeWidth(UserDepartment department, int depth) {
    final children = childDepartments(
      parentId: department.id,
      depth: depth + 1,
    );

    if (children.isEmpty) {
      return _nodeWidth;
    }

    final childWidths = [
      for (final child in children) _subtreeWidth(child, depth + 1),
    ];

    return _childrenWidth(childWidths).clamp(_nodeWidth, double.infinity);
  }

  double _childrenWidth(List<double> childWidths) {
    if (childWidths.isEmpty) {
      return 0.0;
    }

    final totalChildWidth = childWidths.fold(0.0, (sum, width) => sum + width);
    final totalSpacing = (childWidths.length - 1) * _siblingSpacing;

    return totalChildWidth + totalSpacing;
  }
}

class _ChildrenConnector extends StatelessWidget {
  final List<double> childWidths;
  final double spacing;
  final double height;

  const _ChildrenConnector({
    required this.childWidths,
    required this.spacing,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (childWidths.length < 2) {
      return SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    final lineColor = colorScheme.outline.subtle;
    final totalWidth =
        childWidths.fold(0.0, (sum, width) => sum + width) +
        (childWidths.length - 1) * spacing;
    final centers = <double>[];
    var offset = 0.0;

    for (final width in childWidths) {
      centers.add(offset + width / 2);
      offset += width + spacing;
    }

    final firstCenter = centers.first;
    final lastCenter = centers.last;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: totalWidth,
        height: height * 2,
        child: CustomPaint(
          painter: _ChildrenConnectorPainter(
            lineColor: lineColor,
            centers: centers,
            firstCenter: firstCenter,
            lastCenter: lastCenter,
            height: height,
          ),
        ),
      ),
    );
  }
}

class _ChildrenConnectorPainter extends CustomPainter {
  final Color lineColor;
  final List<double> centers;
  final double firstCenter;
  final double lastCenter;
  final double height;

  const _ChildrenConnectorPainter({
    required this.lineColor,
    required this.centers,
    required this.firstCenter,
    required this.lastCenter,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final radius = (height / 2).clamp(4.0, 8.0);
    final parentCenter = size.width / 2;
    final path = Path();

    path.moveTo(parentCenter, 0.0);
    path.lineTo(parentCenter, height);

    path.moveTo(firstCenter + radius, height);
    path.lineTo(lastCenter - radius, height);

    path.moveTo(firstCenter, size.height);
    path.lineTo(firstCenter, height + radius);
    path.quadraticBezierTo(firstCenter, height, firstCenter + radius, height);

    path.moveTo(lastCenter - radius, height);
    path.quadraticBezierTo(lastCenter, height, lastCenter, height + radius);
    path.lineTo(lastCenter, size.height);

    for (final center in centers.skip(1).take(centers.length - 2)) {
      path.moveTo(center, height);
      path.lineTo(center, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ChildrenConnectorPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.centers != centers ||
        oldDelegate.firstCenter != firstCenter ||
        oldDelegate.lastCenter != lastCenter ||
        oldDelegate.height != height;
  }
}

class _DepartmentHeader extends StatelessWidget {
  final UserDepartment department;
  final int depth;
  final int userCount;

  const _DepartmentHeader({
    required this.department,
    required this.depth,
    required this.userCount,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ContentContainer(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      borderRadius: BorderRadius.circular(8.0),
      child: Text(
        department.name,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  final User user;

  const _UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Skeleton.unite(
            child: CircleAvatar(
              backgroundColor: Functions(context).generateColorFromId(user.id),
              radius: 14.0,
              child: Text(
                getInitials(user.username),
                style: const TextStyle(fontSize: 14.0, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              user.username,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (user.position != null)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 72.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  user.position!.name,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface.strong,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyOrganization extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      EmptyStateView(message: Intl.message('data_user_no_item'));
}
