import 'package:flutter/material.dart';
import 'package:shop_app/core/auth/screens/login.dart';
import 'package:shop_app/core/auth/screens/register.dart';
import 'package:shop_app/modules/screens/dashboard.dart';
import 'package:shop_app/utils/constants.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    RouteConstants.LOGIN: (context) => const Login(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    RouteConstants.REGISTER: (context) => const Register(),
    RouteConstants.DASHBOARD: (context) => const DashBoard()
  };
}
