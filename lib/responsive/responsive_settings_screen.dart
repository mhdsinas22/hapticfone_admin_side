import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/%20settings/settings_screen.dart';
import 'package:hapticadmin/web/web_settings_screen.dart';

class ResponsiveSettingsScreen extends StatelessWidget {
  const ResponsiveSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return SettingsScreen();
        } else {
          return WebSettingsScreen();
        }
      },
    );
  }
}
