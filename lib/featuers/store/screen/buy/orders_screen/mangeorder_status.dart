import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:hapticadmin/common/common_controller/dropdown_controller.dart';
import 'package:hapticadmin/common/widgets/customtextbuttom.dart';
import 'package:hapticadmin/common/widgets/orderitems_container.dart';
import 'package:hapticadmin/featuers/store/controllers/ordercontroller.dart';
import 'package:hapticadmin/featuers/store/controllers/sale_revenue_controller.dart';
import 'package:hapticadmin/featuers/store/models/addressmodels.dart';
import 'package:hapticadmin/featuers/store/models/cartmodels.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/address_text.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/common/widgets/dropdown_widget.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';
import 'package:lottie/lottie.dart';

class Mangeorderstatus extends StatelessWidget {
  const Mangeorderstatus({
    super.key,
    required this.orderId,
    required this.userId,
    required this.date,
    required this.time,
    required this.id,
    required this.paymentmode,
    required this.amout,
    required this.cartmodels,
    required this.addressmodels,
    required this.totalamout,
    required this.currentstatus,
    this.isweb = false,
  });
  final String orderId;
  final String userId;
  final String date;
  final String time;
  final String id;
  final String amout;
  final String paymentmode;
  final int totalamout;
  final String currentstatus;
  final List<Cartmodels> cartmodels;
  final Addressmodels? addressmodels;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.find<Ordercontroller>();
    final dropdowncontroller = Get.find<Dropdowncontroller>();
    final salerevnecontroller = Get.find<Salesrevnecontroller>();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            currentstatus == "Order Completed"
                ? Text((""))
                : currentstatus == "Order Cancelled"
                ? Text((""))
                : TextbuttonCustomized(
                  textStyle: TextStyle(color: Appcolors.white),
                  boxDecoration: BoxDecoration(color: Appcolors.black),
                  text: "Update Order",
                  onpressed: () {
                    ordercontroller.updatetheorder(
                      id,
                      userId,
                      time,
                      date,
                      paymentmode,
                      amout,
                      orderId,
                      cartmodels,
                      addressmodels,
                    );
                    if (dropdowncontroller.markorderselectedvalue.value ==
                        "Order Completed") {
                      print(
                        "WORKINGDDDFFFFD${dropdowncontroller.markorderselectedvalue.value}",
                      );
                      salerevnecontroller.createsaleandrevence(
                        date,
                        totalamout,
                      );
                    }
                    Get.snackbar(
                      "Order status",
                      dropdowncontroller.markorderselectedvalue.value,
                      backgroundColor: Appcolors.black,
                      colorText: Appcolors.white,
                    );
                  },
                ),
      ),
      backgroundColor: Appcolors.white,
      appBar: Appbarcustomized(
        title: "MANAGE ORDER STATUS",
        fontsize: isweb ? 1.sp : 23,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: isweb ? 6.w : 15.w),
                Boldtext(text: "ACCOUNT INFORMATION", size: isweb ? 5 : 20),
              ],
            ),
            Row(
              children: [
                SizedBox(width: isweb ? 6.w : 15.w),
                Boldtext(text: "Order ID:$orderId", size: isweb ? 3 : 13),
              ],
            ),
            Row(
              children: [
                SizedBox(width: isweb ? 6.w : 15.w),
                Boldtext(text: "User ID:-$userId", size: isweb ? 3 : 13),
              ],
            ),
            Row(
              children: [
                SizedBox(width: isweb ? 6.w : 15.w),
                Boldtext(text: "Order Date:-$date", size: isweb ? 3 : 13),
                SizedBox(width: isweb ? 3.w : 10.w),
                Boldtext(text: time, size: isweb ? 3 : 13),
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ordercontroller.orders.length,
              itemBuilder: (context, index) {
                var ordersitems = ordercontroller.orders[index];
                return orderId == ordersitems.orderid
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:
                            List.generate(ordersitems.items.length, (index) {
                              var items = ordersitems.items[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OrderitemsContainer(
                                  brand: items.brand,
                                  color: items.color,
                                  itemconunt: items.count.toString(),
                                  phoenname: items.mobilemodelname,
                                  price: items.changingprice.value,
                                  storage: items.storage,
                                  thumbnail: items.thumbnail,
                                  isweb: isweb,
                                ),
                              );
                            }).toList(),
                      ),
                    )
                    : Container();
              },
            ),

            Column(
              children:
                  List.generate(1, (index) {
                    var address = ordercontroller.orders[index].addressmodels;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Addresstext(
                        isweb: isweb,
                        width: isweb ? 390 : 345,
                        name: address!.fullname,
                        address: address.addresss,
                        phonenumber: address.phonenumber.toString(),
                        date: date.toString(),
                        time: time,
                        pincode: address.pincode.toString(),
                      ),
                    );
                  }).toList(),
            ),
            currentstatus == "Order Completed"
                ? Column(
                  children: [
                    Lottie.asset(
                      repeat: false,
                      "assets/Animation - 1750176624863.json",
                      width: isweb ? 20.w : 200.w,
                    ),
                    Boldtext(text: "Order Completed", size: isweb ? 5 : 20),
                  ],
                )
                : currentstatus == "Order Cancelled"
                ? Column(
                  children: [
                    Lottie.asset(
                      "assets/Animation - 1750178353769.json",
                      width: isweb ? 100 : 300,
                      repeat: false,
                    ),
                    Boldtext(text: "Order Cancelled", size: isweb ? 5 : 20),
                  ],
                )
                : Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          SizedBox(width: isweb ? 2.w : 8.w),
                          Boldtext(
                            text: "Mark Order Status",
                            size: isweb ? 5 : 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: isweb ? 370.w : 350.w,
                        child: DropdownWidget(
                          hinttext: "Order Requsted",
                          items:
                              dropdowncontroller.markorderitems.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                          onchanged: (value) {
                            dropdowncontroller.changetheordervalye(value, id);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
