part of '../widget.dart';

class CategoryWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final IssueCategory item;

  const CategoryWidget({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: padding,
      child: Skeleton.unite(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          decoration: ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                color: Functions(context).generateColorFromId(item.id),
              ),
            ),
            color: Functions(
              context,
            ).generateColorFromId(item.id).withValues(alpha: 0.2),
          ),
          child: Text(
            item.name,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Functions(context).generateColorFromId(item.id),
            ),
          ),
        ),
      ),
    );
  }
}
