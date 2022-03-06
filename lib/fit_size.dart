part of nebula;

/// `FitSize` will fit your widget in the provided dimensions. The widget is
/// wrapped in a FittedBox and a SizedBox
class FitSize extends StatelessWidget {
  /// `FitSize` will fit your widget in the provided dimensions. The widget is
  /// wrapped in a FittedBox and a SizedBox
  const FitSize({
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.none,
    required this.child,
  }) : super(key: key);

  /// Height of the widget
  final double? height;

  /// Width of the widget
  final double? width;

  /// Child widget that should be wrapped to fit
  final Widget child;

  /// Fit behaviour
  final BoxFit fit;

  /// How the child should be aligned
  final AlignmentGeometry alignment;

  /// How to clip the child
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        child: child,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
