import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/orders.dart';
import 'package:hapticadmin/web/web_orders_screen.dart';

class ResponsiveOrderScreen extends StatelessWidget {
  const ResponsiveOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Orders();
        } else {
          return WebOrders();
        }
      },
    );
  }
}
