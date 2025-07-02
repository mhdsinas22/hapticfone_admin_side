import 'package:flutter/material.dart';
import 'package:hapticadmin/featuers/store/screen/buy/products_screen/addproducts_screen.dart';
import 'package:hapticadmin/web/web_addproducts_screen.dart';

class ResponsiveAddproductscreen extends StatelessWidget {
  const ResponsiveAddproductscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return AddproductsScreen();
        } else {
          return WebAddproductsScreen();
        }
      },
    );
  }
}
