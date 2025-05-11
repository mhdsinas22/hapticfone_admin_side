import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticadmin/screens/buy/addproducts_screen.dart';
import 'package:hapticadmin/screens/buy/chat.dart';
import 'package:hapticadmin/screens/buy/orders.dart';
import 'package:hapticadmin/screens/buy/revenue_sales.dart';
import 'package:hapticadmin/widgets/alertdialogg.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          ListTile(
            onTap: () => Get.off(() => AddproductsScreen()),
            title: Text(
              "PRODUCTS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Get.off(() => Orders()),
            title: Text(
              "ORDERS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Get.off(() => Chat()),
            title: Text(
              "CHATS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Get.off(() => SalesDashboard()),
            title: Text(
              "Sales Dashborad",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Alertdialogg(context: context).showalertlog(),
            title: Text(
              "LOG OUT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
