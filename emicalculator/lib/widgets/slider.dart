import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  Function fn;
  int value;
  MySlider(this.fn, this.value);

  @override
  Widget build(BuildContext context) {
    print("value received from paremt $value");
    return Container(
      child: Slider(
          value: value.toDouble(),
          min: 1,
          max: 12,
          divisions: 12,
          onChanged: (double value) {
            fn(value.toInt());
          }),
    );
  }
}
