import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/buy/saleDashborad_screen/monthly.dart';
import 'package:hapticadmin/web/web_monthly_screen.dart';

class ResponsiveMonthlyScreen extends StatelessWidget {
  const ResponsiveMonthlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Monthly();
        } else {
          return WebMonthly();
        }
      },
    );
  }
}
