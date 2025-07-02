import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/featuers/store/controllers/ordercontroller.dart';
import 'package:hapticadmin/featuers/store/models/ordermodel.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/mangeorder_status.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';
import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/utils%20/constants/text_strings.dart';

class OrdermangmentScreen extends StatelessWidget {
  const OrdermangmentScreen({
    super.key,
    this.iscancelledorders = false,
    this.isdeliverdorders = false,
  });
  final bool iscancelledorders;
  final bool isdeliverdorders;
  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.find<Ordercontroller>();
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: Appbarcustomized(
        fontsize: 20,
        title:
            iscancelledorders
                ? "CANCELLED ORDERS"
                : isdeliverdorders
                ? "DELIVERD ORDERS"
                : "MANAGE ORDERS",
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          List<Ordermodel> filterditem;
          if (ordercontroller.isloading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (isdeliverdorders) {
            filterditem =
                ordercontroller.orders
                    .where((item) => item.currentstatus == "Order Completed")
                    .toList();
          } else if (iscancelledorders) {
            filterditem =
                ordercontroller.orders
                    .where((item) => item.currentstatus == "Order Cancelled")
                    .toList();
          } else {
            filterditem = ordercontroller.orders;
          }

          return filterditem.isEmpty
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      iscancelledorders
                          ? "NO CANCElLED ORDERS"
                          : isdeliverdorders
                          ? "NO DELIVERED ORDERS"
                          : "NO ORDERS AVAILABLE",
                    ),
                  ),
                ],
              )
              : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filterditem.length,
                itemBuilder: (context, index) {
                  var orderdata = filterditem[index];
                  return Padding(
                    padding: EdgeInsets.all(10.r),
                    child: InkWell(
                      onTap:
                          () => Get.to(
                            (() => Mangeorderstatus(
                              currentstatus: orderdata.currentstatus,
                              orderId: orderdata.orderid,
                              userId: orderdata.userid,
                              date: orderdata.orderconfirmeddate,
                              time: orderdata.confirmedTime,
                              id: orderdata.id,
                              amout: orderdata.totalAmount.toString(),
                              paymentmode: orderdata.paymetmode,
                              cartmodels: orderdata.items,
                              addressmodels: orderdata.addressmodels,
                              totalamout: orderdata.totalAmount.toInt(),
                            )),
                          ),
                      child: RectangleContainer(
                        heigth: 120,
                        boxDecoration: BoxDecoration(
                          color: getStatusColor(orderdata.currentstatus),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Boldtext(text: orderdata.currentstatus, size: 20),
                              Boldtext(
                                text: "Orderid:-${orderdata.orderid}",
                                size: 13,
                              ),
                              Boldtext(
                                text: "Userid :-${orderdata.userid}",
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
        }),
      ),
    );
  }
}
