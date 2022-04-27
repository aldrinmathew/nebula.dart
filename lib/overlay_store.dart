part of nebula;

/// OverlayController is used to push and pop overlay entries to multiple
/// contexts
class OverlayController {
  /// OverlayController is used to push and pop overlay entries to multiple
  /// contexts
  OverlayController();

  void Function(BuildContext)? _push;

  /// This function pushes the appropriate overlay entries to the Overlay stack
  /// and to the provided BuildContext
  void Function(BuildContext) get push => _push ?? (_) {};

  void Function(BuildContext)? _pop;

  /// This function dismisses any existing overlays that were previously pushed
  /// to by this controller
  void Function(BuildContext) get pop => _pop ?? (_) {};
}

/// OverlayStore handles pushing overlays to multiple contexts and popping them
/// appropriately, or upon user request.
///
/// This class works alongside the [OverlayController] to acheive the desirable
/// results.
class OverlayStore {
  /// Builder that describes the UI of the Overlay
  final Widget Function(BuildContext) builder;

  /// Controller for the [OverlayStore]
  final OverlayController controller;

  /// All [OverlayEntry] objects pushed so far
  ///
  /// This will not contain any popped entries
  final List<OverlayEntry> _overlayEntries = [];

  /// If `dismissOnBoundary` was true, then a non-null value will be added to
  /// this list on every push
  final List<OverlayEntry?> _backgrounds = [];

  /// All the contexts to which entries have been pushed so far
  final List<BuildContext> _contexts = [];

  /// Whether to dimiss the overlay when the user taps
  final bool _dismissOnBoundary;

  /// OverlayStore handles pushing overlays to multiple contexts and popping them
  /// appropriately, or upon user request.
  ///
  /// This class works alongside the [OverlayController] to acheive the desirable
  /// results.
  OverlayStore({
    required this.builder,
    required this.controller,
    bool dismissOnBoundary = true,
  }) : _dismissOnBoundary = dismissOnBoundary {
    controller._push = (ctx) {
      if (Overlay.of(ctx) != null) {
        _contexts.add(ctx);
        _backgrounds.add(
          _dismissOnBoundary
              ? OverlayEntry(
                  builder: (context) => Positioned.fill(
                    child: GestureDetector(
                      onTap: () => controller.pop(_contexts.last),
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                )
              : null,
        );
        _overlayEntries
            .add(OverlayEntry(builder: (context) => builder(context)));
        List<OverlayEntry> entries = [];
        if (_backgrounds.last != null) {
          entries.add(_backgrounds.last!);
        }
        entries.add(_overlayEntries.last);
        Overlay.of(ctx)!.insertAll(entries);
      }
    };
    controller._pop = (ctx) {
      var i = _contexts.indexOf(ctx);
      if (i >= 0) {
        if (_backgrounds[i] != null) {
          _backgrounds[i]!.remove();
        }
        _backgrounds.removeAt(i);
        _overlayEntries[i].remove();
        _overlayEntries.removeAt(i);
        _contexts.removeAt(i);
      } else {
        debugPrint('OverlayBuilder: No overlays found in the provided context');
      }
    };
  }
}
