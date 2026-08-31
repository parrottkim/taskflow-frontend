part of '../widget.dart';

class UserInfo extends StatelessWidget {
  final User user;
  final double avatarRadius;
  final double spacing;
  final TextStyle? usernameStyle;
  final TextStyle? emailStyle;
  final bool showEmail;
  final bool showDepartment;
  final bool showPosition;

  const UserInfo({
    super.key,
    required this.user,
    this.avatarRadius = 16.0,
    this.spacing = 8.0,
    this.usernameStyle = const TextStyle(fontWeight: FontWeight.w600),
    this.emailStyle,
    this.showEmail = true,
    this.showDepartment = false,
    this.showPosition = false,
  });

  factory UserInfo.compact({Key? key, required User user}) {
    return UserInfo(
      key: key,
      user: user,
      avatarRadius: 10.0,
      spacing: 6.0,
      usernameStyle: const TextStyle(fontWeight: FontWeight.w500),
      showEmail: false,
      showDepartment: false,
      showPosition: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final positionAndRank = [
      if (user.position != null) user.position!.name,
      if (user.rank != null) user.rank!.name,
    ].join(' • ');

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Skeleton.unite(
          child: CircleAvatar(
            backgroundColor: Functions(context).generateColorFromId(user.id),
            radius: avatarRadius,
            child: Text(
              getInitials(user.username),
              style: TextStyle(fontSize: avatarRadius, color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: spacing),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(user.username, style: usernameStyle),
                if (showPosition && positionAndRank.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      positionAndRank,
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface.strong,
                      ),
                    ),
                  ),
              ],
            ),
            if (showEmail)
              Text(
                user.email,
                style:
                    emailStyle ??
                    textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface.strong,
                    ),
              ),
          ],
        ),
        if (showEmail && showDepartment && user.department != null)
          const Spacer(),
        if (showDepartment && user.department != null)
          Text(
            user.department!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.strong,
            ),
          ),
      ],
    );
  }
}
