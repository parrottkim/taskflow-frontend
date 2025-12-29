part of 'widget.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  SliverAppBarDelegate(
    this._tabBar,
  );

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.vertical(
          top: shrinkOffset > 0 ? Radius.circular(16.0) : Radius.zero,
          bottom: Radius.zero,
        ),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return _tabBar != oldDelegate._tabBar;
  }
}
