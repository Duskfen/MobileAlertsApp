import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ContextMenuBuilder = Widget Function(
    BuildContext context, Offset offset);

/// Shows and hides the context menu based on user gestures.
///
/// By default, shows the menu on right clicks and long presses.
class DeviceContextMenuRegion extends StatefulWidget {
  /// Creates an instance of [DeviceContextMenuRegion].
  const DeviceContextMenuRegion({
    super.key,
    required this.child,
    required this.contextMenuBuilder,
  });

  /// Builds the context menu.
  final ContextMenuBuilder contextMenuBuilder;

  /// The child widget that will be listened to for gestures.
  final Widget child;

  @override
  State<DeviceContextMenuRegion> createState() =>
      DeviceContextMenuRegionState();
}

class DeviceContextMenuRegionState extends State<DeviceContextMenuRegion>
    with TickerProviderStateMixin {
  Offset? _longPressOffset;
  final GlobalKey _key = GlobalKey();
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this);
  late final Animation<double> _animation = Tween<double>(begin: 1, end: 1.02)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

  final ContextMenuController _contextMenuController = ContextMenuController();

  static bool get _longPressEnabled {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return true;
      case TargetPlatform.macOS:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
    }
  }

  void _onSecondaryTapUp(TapUpDetails details) {
    _show(details.globalPosition);
  }

  void _onTap() {
    if (!_contextMenuController.isShown) {
      return;
    }
    hide();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    final RenderBox renderBox =
        _key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset =
        renderBox.localToGlobal(Offset.zero); // dx, dy = top left

    _longPressOffset = Offset(
        details.globalPosition.dx, offset.dy + 20); //details.globalPosition;
  }

  void _onLongPress() {
    assert(_longPressOffset != null);
    _show(_longPressOffset!);
    _longPressOffset = null;
  }

  void _show(Offset position) {
    _controller.forward();
    _contextMenuController.show(
      context: context,
      contextMenuBuilder: (BuildContext context) {
        return Stack(
          children: [
            widget.contextMenuBuilder(context, position),
            if (defaultTargetPlatform == TargetPlatform.android)
              Positioned(
                top: position.dy - 8,
                left: position.dx - 12,
                child: CustomPaint(
                  painter: TrianglePainter(
                      color: Theme.of(context)
                          .colorScheme
                          .background), // adjust the color of the triangle to your liking
                  size: const Size(
                      24, 12), // adjust the size of the triangle to your liking
                ),
              ),
          ],
        );
      },
    );
  }

  void hide() {
    _contextMenuController.remove();
    _controller.reverse();
  }

  @override
  void dispose() {
    hide();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
          key: _key,
          behavior: HitTestBehavior.opaque,
          onSecondaryTapUp: _onSecondaryTapUp,
          onTap: _onTap,
          onLongPress: _longPressEnabled ? _onLongPress : null,
          onLongPressStart: _longPressEnabled ? _onLongPressStart : null,
          child: widget.child),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    Path path = Path();
    path.moveTo(0, 0.1);
    path.lineTo(size.width, 0.1);
    path.lineTo(size.width / 2, size.height + 0.1);
    path.close();
    canvas.drawShadow(path, Colors.black, 1.5, false);

    path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
