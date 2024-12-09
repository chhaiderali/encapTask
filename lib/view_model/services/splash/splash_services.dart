import 'dart:async';
import 'package:flutter/material.dart';
import '../../../configs/routes/routes_name.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
    );
  }
}
