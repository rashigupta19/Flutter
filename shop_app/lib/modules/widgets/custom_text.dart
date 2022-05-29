import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String label;
  late bool isMultiline;
  late TextEditingController tc;

  CustomText({required this.label, this.isMultiline = false, required this.tc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          controller: tc,
          maxLines: isMultiline ? 4 : 1,
          decoration: InputDecoration(
              hintText: label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ));
  }
}
