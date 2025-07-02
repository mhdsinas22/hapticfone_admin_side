import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:hapticadmin/common/widgets/sell_home_screen.dart';

import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/responsive/responsive_addproductscreen.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(title: "HOME", fontsize: 10),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () => Get.off(() => ResponsiveAddproductscreen()),
              child: RectangleContainer(
                width: 374,
                heigth: 114,
                boxDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: 20.w),
                    Image.asset(
                      "assets/images__1_-removebg-preview.png",
                      width: 100.w,
                    ),
                    // SizedBox(width: 20.w),
                    Text(
                      "Buy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.to(() => Sellhomescreen()),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: RectangleContainer(
                width: 374,
                heigth: 114,
                boxDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30.w),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/lovepik-rhino-modeling-phone-png-image_401774514_wh1200-removebg-preview.png",
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 40.w),
                    Text(
                      "Sell",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
