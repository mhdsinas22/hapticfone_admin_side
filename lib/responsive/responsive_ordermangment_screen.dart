import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/ordermangment_screen.dart';
import 'package:hapticadmin/web/web_ordermangmet_screen.dart';

class ResponsiveOrdermangmentScreen extends StatelessWidget {
  const ResponsiveOrdermangmentScreen({
    super.key,
    this.isdeliverdorders = false,
    this.iscancelledorders = false,
  });
  final bool isdeliverdorders;
  final bool iscancelledorders;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return OrdermangmentScreen(
            isdeliverdorders: isdeliverdorders,
            iscancelledorders: iscancelledorders,
          );
        } else {
          return WebOrdermangmentScreen(
            iscancelledorders: iscancelledorders,
            isdeliverdorders: isdeliverdorders,
          );
        }
      },
    );
  }
}
