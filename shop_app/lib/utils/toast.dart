import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

createToast(String msg, BuildContext context) async {
  await Flushbar(
    title: 'Shop App',
    message: msg,
    duration: Duration(seconds: 3),
  ).show(context);
}
