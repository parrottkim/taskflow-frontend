part of 'widget.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show(BuildContext context) {
    if (!_isVisible) {
      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Background overlay
            Positioned.fill(
              child: GestureDetector(
                onTap: () {}, // Handle tap events if needed
                child: Container(color: Colors.black87.withValues(alpha: 0.2)),
              ),
            ),
            // Centered loading indicator
            Positioned.fill(
              child: Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
      _isVisible = true;
    }
  }

  static void hide() {
    if (_isVisible && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }
}

class TextOverlay {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show(BuildContext context, String text) {
    if (!_isVisible) {
      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Background overlay
            Positioned.fill(
              child: GestureDetector(
                onTap: () {}, // Handle tap events if needed
                child: Container(color: Colors.black87.withValues(alpha: 0.2)),
              ),
            ),
            // Centered loading indicator
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoadingAnimationWidget.progressiveDots(
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
      _isVisible = true;
    }
  }

  static void hide() {
    if (_isVisible && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }
}

class TooltipOverlay extends HookWidget {
  final Widget message;
  final Widget child;
  final Duration animationDuration;

  const TooltipOverlay({
    super.key,
    required this.message,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    final overlayEntry = useRef<OverlayEntry?>(null);
    final isVisible = useState(false);
    final animationController = useAnimationController(
      duration: animationDuration,
      reverseDuration: animationDuration,
    );

    void hide() async {
      if (overlayEntry.value == null) return;
      await animationController.reverse();
      overlayEntry.value?.remove();
      overlayEntry.value = null;
      isVisible.value = false;
    }

    void show() {
      if (overlayEntry.value != null) return;

      final renderBox = context.findRenderObject() as RenderBox;
      final target = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;

      overlayEntry.value = OverlayEntry(
        builder: (_) => Stack(
          children: [
            // 배경 전체 터치 감지
            Positioned.fill(
              child: GestureDetector(
                onTap: hide,
                child: Container(color: Colors.transparent),
              ),
            ),
            // Tooltip 위젯
            Positioned(
              left: target.dx,
              top: target.dy + size.height + 8,
              child: FadeTransition(
                opacity: animationController,
                child: GestureDetector(
                  onTap: () {}, // 자기 자신 탭은 닫지 않음
                  child: Material(
                    elevation: 1.0,
                    borderRadius: BorderRadius.circular(4.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 42.0,
                            top: 12.0,
                            bottom: 12.0,
                          ),
                          child: message,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomIconButton(
                            onTap: hide,
                            icon: Icon(Symbols.close, size: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context, rootOverlay: true).insert(overlayEntry.value!);
      animationController.forward();
      isVisible.value = true;
    }

    useEffect(() {
      return () {
        overlayEntry.value?.remove();
      };
    }, []);

    return GestureDetector(
      onTap: () {
        if (isVisible.value) {
          hide();
        } else {
          show();
        }
      },
      child: child,
    );
  }
}
