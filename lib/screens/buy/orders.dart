import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/widgets/appbar_custmized.dart';
import 'package:hapticadmin/widgets/container/rectangle_contianer.dart';
import 'package:hapticadmin/widgets/drawer_custom.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(title: "ORDERS"),
      drawer: DrawerCustom(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RectangleContainer(
              width: 330,
              heigth: 125,
              boxDecoration: BoxDecoration(border: Border.all()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/truck.png", width: 150.w, height: 70.h),
                  Text(
                    "Orders Management",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RectangleContainer(
                  width: 155,
                  heigth: 91,
                  boxDecoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.done_all, size: 40.sp),
                      Text(
                        "Delivered Orders",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                RectangleContainer(
                  width: 155,
                  heigth: 91,
                  boxDecoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/cancel.png", width: 155, height: 40),
                      Text(
                        "Cancelled Orders",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
