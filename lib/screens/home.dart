import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:hapticadmin/screens/buy/addproducts_screen.dart';
import 'package:hapticadmin/widgets/appbar_custmized.dart';
import 'package:hapticadmin/widgets/container/rectangle_contianer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(title: "HOME"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () => Get.off(() => AddproductsScreen()),
              child: RectangleContainer(
                width: 374,
                heigth: 114,
                boxDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images__1_-removebg-preview.png",
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "Buy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: RectangleContainer(
              width: 374,
              heigth: 114,
              boxDecoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/lovepik-rhino-modeling-phone-png-image_401774514_wh1200-removebg-preview.png",
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Sell",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
