import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:intl/intl.dart';

String generteOrderid() {
  final now = DateTime.now();
  return "ORD${now.millisecondsSinceEpoch}";
}

String dateandtimefomrat() {
  DateTime date = DateTime.now();
  String fromateddate = DateFormat("d MMM yyyy").format(date);
  return fromateddate;
}

String timeformat() {
  DateTime date = DateTime.now();
  String formattime = DateFormat("h:mm a").format(date);
  return formattime;
}

// void openinstagrma() async {
//   final url = Uri.parse("https://instagram.com/haptic.fone'");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
Color getStatusColor(String status) {
  switch (status) {
    case "Order Completed":
      return Colors.green;
    case "Order Cancelled":
      return Appcolors.error;
    case "Order Started":
      return Colors.lightBlue;
    case "Order Conifrmed":
      return Appcolors.appbuttongreen;
    default:
      return Colors.yellow;
  }
}
