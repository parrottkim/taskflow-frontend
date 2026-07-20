part of 'widget.dart';

class UserInformation extends StatelessWidget {
  final User user;
  final double avatarRadius;
  final double spacing;
  final TextStyle? usernameStyle;
  final TextStyle? emailStyle;
  final bool showEmail;
  final bool showDepartment;
  final bool showPosition;

  const UserInformation({
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

  factory UserInformation.compact({Key? key, required User user}) {
    return UserInformation(
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
                if (showDepartment && user.department != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '• ${user.department!.name}',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
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
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
              ),
          ],
        ),
        if (showEmail) Spacer(),
        if (showPosition)
          Text(
            user.position != null
                ? user.position!.name
                : Intl.message('unspecified'),
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
      ],
    );
  }
}
