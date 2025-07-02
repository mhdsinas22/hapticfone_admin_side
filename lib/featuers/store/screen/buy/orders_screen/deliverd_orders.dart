import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/featuers/store/controllers/ordercontroller.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/mangeorder_status.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

class Deliverdorders extends StatelessWidget {
  const Deliverdorders({super.key, this.iscancelledorders = false});
  final bool iscancelledorders;
  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.find<Ordercontroller>();
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: Appbarcustomized(
        fontsize: 20,
        title: iscancelledorders ? "CANCELLED ORDERS" : "MANAGE ORDERS",
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return ordercontroller.orders.isEmpty
              ? Text("EMPTY")
              : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ordercontroller.orders.length,
                itemBuilder: (context, index) {
                  var orderdata = ordercontroller.orders[index];
                  return Padding(
                    padding: EdgeInsets.all(10.r),
                    child: InkWell(
                      onTap:
                          () => Get.to(
                            (() => Mangeorderstatus(
                              currentstatus: orderdata.currentstatus,
                              totalamout: orderdata.totalAmount.toInt(),
                              orderId: orderdata.orderid,
                              userId: orderdata.userid,
                              date: orderdata.orderconfirmeddate,
                              time: orderdata.confirmedTime,
                              id: orderdata.id,
                              amout: orderdata.totalAmount.toString(),
                              paymentmode: orderdata.paymetmode,
                              cartmodels: orderdata.items,
                              addressmodels: orderdata.addressmodels,
                            )),
                          ),
                      child: RectangleContainer(
                        heigth: 120,
                        boxDecoration: BoxDecoration(
                          color: Appcolors.greycolor,
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
