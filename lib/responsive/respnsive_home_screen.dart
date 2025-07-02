import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/home.dart';
import 'package:hapticadmin/web/web_home_screen.dart';

class RespnsiveHomeScreen extends StatelessWidget {
  const RespnsiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Home();
        } else {
          return WebHome();
        }
      },
    );
  }
}
