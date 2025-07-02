import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/authencation/screen/login_screen.dart';
import 'package:hapticadmin/web/web_login_screen.dart';

class ResponsiveLoginScreen extends StatelessWidget {
  const ResponsiveLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return LoginScreen();
        } else {
          return WebLoginScreen();
        }
      },
    );
  }
}
