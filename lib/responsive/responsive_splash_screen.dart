import 'package:flutter/material.dart';
import 'package:hapticadmin/splashscreen/splashscreen.dart';
import 'package:hapticadmin/web/web_splash_screen.dart';

class ResponsiveSplashScreen extends StatelessWidget {
  const ResponsiveSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Splashscreen();
        } else {
          return WebSplashscreen();
        }
      },
    );
  }
}
