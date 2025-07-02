import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/buy/products_screen/addstock_page.dart';
import 'package:hapticadmin/web/web_addstock_screen.dart';

class ResponsiveAddstockScreen extends StatelessWidget {
  const ResponsiveAddstockScreen({super.key, this.editpage = false});
  final bool editpage;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return AddstockPage(editpage: editpage);
        } else {
          return WebAddstockPage(editpage: editpage);
        }
      },
    );
  }
}
