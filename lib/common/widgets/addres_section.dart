import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:hapticadmin/featuers/store/controllers/ordercontroller.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/address_text.dart';

class Addressection extends StatelessWidget {
  const Addressection({super.key, required this.orderod});

  final String orderod;
  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.find<Ordercontroller>();
    return Obx(() {
      if (ordercontroller.orders.isEmpty) {
        return CircularProgressIndicator();
      }

      final matchedOrder = ordercontroller.orders.firstWhereOrNull(
        (e) => e.orderid == orderod,
      );

      if (matchedOrder == null || matchedOrder.addressmodels == null) {
        return SizedBox(); // Or a fallback widget
      }

      final address = matchedOrder.addressmodels!;
      return Addresstext(
        name: address.fullname,
        address: address.addresss,
        phonenumber: address.phonenumber.toString(),
        date: matchedOrder.orderconfirmeddate,
        time: matchedOrder.confirmedTime,
        pincode: address.pincode.toString(),
      );
    });
  }
}
