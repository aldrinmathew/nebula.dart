import 'package:flutter/material.dart';
import 'package:nebula/nebula.dart';

class MyExample extends StatefulWidget {
  @override
  _MyExampleState createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
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
}
