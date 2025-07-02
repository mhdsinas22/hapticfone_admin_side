import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/common/widgets/drawer_custom.dart';
import 'package:hapticadmin/common/widgets/sales_revenue_container.dart';
import 'package:hapticadmin/featuers/store/controllers/sale_revenue_controller.dart';

import 'package:hapticadmin/featuers/store/screen/buy/saleDashborad_screen/daliy.dart';
import 'package:hapticadmin/featuers/store/screen/buy/saleDashborad_screen/line_cart.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

class Monthly extends StatelessWidget {
  const Monthly({super.key});

  @override
  Widget build(BuildContext context) {
    final salerevnecontroller = Get.find<Salesrevnecontroller>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(
        title: "REVENUE & SALES",
        fontsize: 20,
        action: [
          IconButton(
            onPressed: () => salerevnecontroller.selectMonth(context),
            icon: Icon(Icons.calendar_month, size: 25.sp),
          ),
        ],
      ),
      drawer: DrawerCustom(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RectangleContainer(
                width: MediaQuery.of(context).size.width,
                heigth: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offAll(
                          () => Daliy(),
                          transition: Transition.noTransition,
                        );
                      },
                      child: RectangleContainer(
                        boxDecoration: BoxDecoration(
                          color: Appcolors.greycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 147.99.w,
                        heigth: 40.h,
                        child: Center(
                          child: Boldtext(
                            text: "Daily",
                            size: 15,
                            colors: Appcolors.white,
                          ),
                        ),
                      ),
                    ),

                    RectangleContainer(
                      boxDecoration: BoxDecoration(
                        color: Appcolors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 147.99.w,
                      heigth: 40.h,
                      child: Center(
                        child: Boldtext(
                          size: 15,
                          text: "Monthy",
                          colors: Appcolors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => Salesrevuncecontainer(
                    text: "TOTAL REVENUE",
                    needicon: false,
                    price: salerevnecontroller.totalmontreveb.value.toString(),
                    needrupeesign: true,
                  ),
                ),
                Obx(
                  () => Salesrevuncecontainer(
                    needrupeesign: false,
                    needicon: true,
                    text: "TOTAL ORDERS ",
                    price:
                        salerevnecontroller.totalorderinmonth.value.toString(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Boldtext(text: "REVENUE TIMELINE", size: 18.sp),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Obx(() {
              if (salerevnecontroller.revenueSpots.isEmpty) {
                return const Center(child: Text("No Data Available"));
              }
              return RevenueLineChart(
                isdaily: false,
                spots: salerevnecontroller.revenueSpots,
              );
            }),
          ],
        ),
      ),
    );
  }
}
