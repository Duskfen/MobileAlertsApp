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

class DeviceContextMenuRegionState extends State<DeviceContextMenuRegion> {
  Offset? _longPressOffset;
  GlobalKey key = GlobalKey();

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
    _hide();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset =
        renderBox.localToGlobal(Offset.zero); // dx, dy = top left

    _longPressOffset = Offset(offset.dx + 100,
        offset.dy + renderBox.size.height + 56); //details.globalPosition;
  }

  void _onLongPress() {
    assert(_longPressOffset != null);
    _show(_longPressOffset!);
    _longPressOffset = null;
  }

  void _show(Offset position) {
    _contextMenuController.show(
      context: context,
      contextMenuBuilder: (BuildContext context) {
        return widget.contextMenuBuilder(context, position);
      },
    );
  }

  void _hide() {
    _contextMenuController.remove();
  }

  @override
  void dispose() {
    _hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: key,
        behavior: HitTestBehavior.opaque,
        onSecondaryTapUp: _onSecondaryTapUp,
        onTap: _onTap,
        onLongPress: _longPressEnabled ? _onLongPress : null,
        onLongPressStart: _longPressEnabled ? _onLongPressStart : null,
        child: widget.child);
  }
}
