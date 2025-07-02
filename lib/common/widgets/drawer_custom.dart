import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticadmin/common/alertdialog/alert_dialogg.dart';
import 'package:hapticadmin/featuers/authencation/screen/login_screen.dart';
import 'package:hapticadmin/responsive/responsive_addproductscreen.dart';
import 'package:hapticadmin/responsive/responsive_daily_screen.dart';
import 'package:hapticadmin/responsive/responsive_order_screen.dart';
import 'package:hapticadmin/responsive/responsive_settings_screen.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          ListTile(
            onTap: () => Get.off(() => ResponsiveAddproductscreen()),
            title: Text(
              "PRODUCTS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isweb ? 3.sp : 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Get.off(() => ResponsiveOrderScreen()),
            title: Text(
              "ORDERS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isweb ? 3.sp : 16.sp,
              ),
            ),
          ),
          // Container(height: 1.h, width: double.infinity, color: Colors.white),
          // ListTile(
          //   onTap: () => Get.off(() => Chat()),
          //   title: Text(
          //     "CHATS",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16.sp,
          //     ),
          //   ),
          // ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Get.off(() => ResponsiveDailyScreen()),
            title: Text(
              "Sales Dashborad",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isweb ? 3.sp : 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap: () => Get.off(() => ResponsiveSettingsScreen()),
            title: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isweb ? 3.sp : 16.sp,
              ),
            ),
          ),
          Container(height: 1.h, width: double.infinity, color: Colors.white),
          ListTile(
            onTap:
                () => Alertdialogg(
                  context: context,
                  titletext: "Confirm LogOut",
                  leftsidetext: "Cancel",
                  rightsidetext: "LogOut",
                  onpressd:
                      () => Get.offAll(
                        () => LoginScreen(),
                        transition: Transition.leftToRightWithFade,
                      ),
                ).showalertlog(isweb),
            title: Text(
              "LOG OUT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isweb ? 3.sp : 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
