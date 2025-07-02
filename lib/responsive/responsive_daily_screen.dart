import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/buy/saleDashborad_screen/daliy.dart';
import 'package:hapticadmin/web/web_daily_Screen.dart';

class ResponsiveDailyScreen extends StatelessWidget {
  const ResponsiveDailyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Daliy();
        } else {
          return WebDaliy();
        }
      },
    );
  }
}
