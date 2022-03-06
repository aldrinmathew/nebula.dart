part of nebula;

/// `Dimension` is a Builder widget that gives the height and width
/// derived from the provided BuildContext. If the context is null,
/// then this will give the height and width of its own context as
/// in the widget tree
class Dimension extends StatefulWidget {
  /// `Dimension` is a Builder widget that gives the height and width
  /// derived from the provided BuildContext. If the context is null,
  /// then this will give the height and width of its own context
  /// as in the widget tree
  const Dimension({
    Key? key,
    this.context,
    required this.builder,
  }) : super(key: key);

  /// The BuildContext from which the height and width is to be derived
  ///
  /// If this is null, the native context of this widget will be used
  final BuildContext? context;

  /// The builder function that uses the height and width for custom
  /// layout. This should return a widget
  final Widget Function(double height, double width) builder;

  @override
  _DimensionState createState() => _DimensionState();
}

/// State of the Dimension widget
class _DimensionState extends State<Dimension> {
  /// Build function
  @override
  Widget build(BuildContext context) {
    return widget.builder(
      /// Height of the appropriate context
      MediaQuery.of(widget.context ?? context).size.height,

      /// Width of the appropriate context
      MediaQuery.of(widget.context ?? context).size.width,
    );
  }
}
