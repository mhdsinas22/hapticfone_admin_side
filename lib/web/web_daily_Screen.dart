import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/common/widgets/drawer_custom.dart';
import 'package:hapticadmin/common/widgets/sales_revenue_container.dart';
import 'package:hapticadmin/featuers/store/controllers/sale_revenue_controller.dart';
import 'package:hapticadmin/featuers/store/screen/buy/saleDashborad_screen/line_cart.dart';
import 'package:hapticadmin/responsive/responsive_monthly_screen.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

class WebDaliy extends StatelessWidget {
  const WebDaliy({super.key});

  @override
  Widget build(BuildContext context) {
    final saleRevenueController = Get.find<Salesrevnecontroller>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(
        title: "REVENUE & SALES",
        fontsize: 5,
        action: [
          IconButton(
            onPressed: () => saleRevenueController.selectDate(context),
            icon: Icon(Icons.calendar_month, size: 5.sp),
          ),
        ],
      ),
      drawer: DrawerCustom(isweb: true),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RectangleContainer(
                heigth: 50.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RectangleContainer(
                      boxDecoration: BoxDecoration(
                        color: Appcolors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 30.99.w,
                      heigth: 40.h,
                      child: Center(
                        child: Boldtext(
                          text: "Daily",
                          size: 5,
                          colors: Appcolors.white,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap:
                          () => Get.offAll(
                            () => ResponsiveMonthlyScreen(),
                            transition: Transition.noTransition,
                          ),
                      child: RectangleContainer(
                        boxDecoration: BoxDecoration(
                          color: Appcolors.greycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 30.99.w,
                        heigth: 40.h,
                        child: Center(
                          child: Boldtext(
                            size: 5,
                            text: "Monthly",
                            colors: Appcolors.white,
                          ),
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
                    isweb: true,
                    needrupeesign: true,
                    text: "TOTAL REVENUE",
                    needicon: false,
                    price: saleRevenueController.totalRevenue.value.toString(),
                  ),
                ),
                Obx(
                  () => Salesrevuncecontainer(
                    isweb: true,
                    needrupeesign: false,
                    needicon: true,
                    text: "TOTAL ORDERS ",
                    price: saleRevenueController.totalOrders.value.toString(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Boldtext(text: "REVENUE TIMELINE", size: 1.sp),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Obx(() {
              if (saleRevenueController.dailyRevenuespots.isEmpty) {
                return const Center(child: Text("No Data Available"));
              }
              return RevenueLineChart(
                isdaily: true,
                spots: saleRevenueController.dailyRevenuespots,
              );
            }),
          ],
        ),
      ),
    );
  }
}
