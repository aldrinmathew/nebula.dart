## **`nebula`**

Makes your Flutter development journey easier by providing helper widgets, utilities and abstractions.

### **`Dimension`** widget

Get the dimensions (height and width) associated to a context, instead of doing `MediaQuery` each and every time.

```dart
Dimension(
  /// You can omit the context, in which case the
  /// widget will use its own context
  context: context,
  builder: (h, w) {
    return Row(
      children: [
        SizedBox(
          height: h * 0.3,
          width: w * 0.3,
          child: Center(child: Text('A')),
        ),
        SizedBox(
          height: h * 0.3,
          width: w * 0.5,
          child: Center(child: Text('B')),
        ),
        SizedBox(
          height: h * 0.3,
          width: w * 0.2,
          child: Center(child: Text('C')),
        ),
      ],
    );
  },
)
```

The `context` argument is nullable, so if you skip it, the the Dimension widget will use its own context to get the height and width


### **`FitSize`** widget

This widget will fit your widget in the provided dimensions. The widget is wrapped in a FittedBox and a SizedBox with the provided arguments passed over. You can use this like `SizedBox`, just that the contents will be fitted in the dimensions provided

```dart
FitSize(
  height: 250,
  alignment: Alignment.topRight,
  fit: BoxFit.fitWidth,
  clipBehavior: Clip.none,
  child: Text('This is my FitSize'),
),
```