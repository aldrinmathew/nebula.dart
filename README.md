## **`nebula`**

Makes your Flutter development journey easier by providing helper widgets, utilities and abstractions.

### **`Dimension`** widget

Get the dimensions (height and width) associated to a context, instead of doing `MediaQuery` each and every time.

```dart
@override
  Widget build(BuildContext context) {
    return Center(
      child: Dimension(
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
      ),
    );
  }
```

The `context` argument is nullable, so if you skip it, the the Dimension widget will use its own context to get the height and width