part of 'widget.dart';

class BentoTile {
  final int row;
  final int column;
  final int rowSpan;
  final int columnSpan;
  final Widget child;

  BentoTile({
    required this.row,
    required this.column,
    this.rowSpan = 1,
    this.columnSpan = 1,
    required this.child,
  });
}

class BentoGrid extends StatefulWidget {
  final int rows;
  final int columns;
  final List<BentoTile> tiles;
  final double spacing;

  const BentoGrid({
    super.key,
    required this.rows,
    required this.columns,
    required this.tiles,
    this.spacing = 16.0,
  });

  @override
  State<BentoGrid> createState() => _BentoGridState();
}

class _BentoGridState extends State<BentoGrid> {
  final List<GlobalKey> _tileKeys = [];
  double _maxTileHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _tileKeys.addAll(List.generate(widget.tiles.length, (_) => GlobalKey()));
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureTiles());
  }

  void _measureTiles() {
    double maxHeight = 0;

    for (final key in _tileKeys) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        if (box.hasSize) {
          final h = box.size.height;
          if (h > maxHeight) maxHeight = h;
        }
      }
    }

    if (mounted && maxHeight != _maxTileHeight) {
      setState(() {
        _maxTileHeight = maxHeight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final hasBoundedHeight = constraints.hasBoundedHeight;
        final maxHeight = constraints.maxHeight;

        final tileWidth =
            (maxWidth - (widget.columns - 1) * widget.spacing) / widget.columns;

        double tileHeight;
        double totalHeight;

        if (!hasBoundedHeight && _maxTileHeight == 0) {
          // 1단계: 높이 미측정 상태 - 자식들을 Wrap으로 렌더링해서 높이 측정

          return Skeletonizer(
            child: Wrap(
              spacing: widget.spacing,
              runSpacing: widget.spacing,
              children: widget.tiles
                  .asMap()
                  .entries
                  .map(
                    (e) => SizedBox(
                      key: _tileKeys[e.key],
                      width:
                          tileWidth * widget.tiles[e.key].columnSpan +
                          widget.spacing * (widget.tiles[e.key].columnSpan - 1),
                      child: e.value.child,
                    ),
                  )
                  .toList(),
            ),
          );
        }

        // 2단계: 측정 후 _maxTileHeight가 세팅되면 이 높이를 사용해서 본인 높이를 계산
        if (hasBoundedHeight) {
          totalHeight = maxHeight;
          tileHeight =
              (totalHeight - (widget.rows - 1) * widget.spacing) / widget.rows;
        } else {
          tileHeight = _maxTileHeight;
          totalHeight =
              widget.rows * tileHeight + (widget.rows - 1) * widget.spacing;
        }

        final positionedTiles = widget.tiles.map((tile) {
          final left = (tile.column - 1) * (tileWidth + widget.spacing);
          final top = (tile.row - 1) * (tileHeight + widget.spacing);
          final width =
              tile.columnSpan * tileWidth +
              (tile.columnSpan - 1) * widget.spacing;
          final height =
              tile.rowSpan * tileHeight + (tile.rowSpan - 1) * widget.spacing;

          return Positioned(
            left: left,
            top: top,
            width: width,
            height: height,
            child: tile.child,
          );
        }).toList();

        return SizedBox(
          width: maxWidth,
          height: totalHeight,
          child: Stack(children: positionedTiles),
        );
      },
    );
  }
}
