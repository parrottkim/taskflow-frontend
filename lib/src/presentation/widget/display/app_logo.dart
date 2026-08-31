part of '../widget.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = 64.0});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(size / 4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 4),
        color: colorScheme.primary,
      ),
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
        colorFilter: ColorFilter.mode(colorScheme.onPrimary, BlendMode.srcIn),
      ),
    );
  }
}
