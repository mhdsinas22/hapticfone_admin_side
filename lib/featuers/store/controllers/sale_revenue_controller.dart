import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/datas/repositry/order_repositry.dart';
import 'package:hapticadmin/featuers/store/models/ordermodel.dart';

import 'package:hapticadmin/featuers/store/models/revencesalemodels.dart';
import 'package:intl/intl.dart';

class Salesrevnecontroller extends GetxController {
  static Salesrevnecontroller get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchDailyRevenue(DateTime.now());
    fetchMonthlyRevene(
      DateTime(DateTime.now().year, DateTime.now().month, 1),
      DateTime.now(),
    );
  }

  final _db = FirebaseFirestore.instance;
  final RxDouble totalRevenue = 0.0.obs;
  var totalOrders = 0.obs;
  DateTime? selectedvalue;
  final orderrepositry = Get.find<OrderRepositry>();
  var orders = <Ordermodel>[].obs;
  RxList<FlSpot> revenueSpots = <FlSpot>[].obs;
  List<FlSpot> newSpotsList = [];
  RxList<FlSpot> dailyRevenuespots = <FlSpot>[].obs;
  List<FlSpot> dailynewRevenuespo = <FlSpot>[].obs;
  Future<void> createsaleandrevence(String date, int amount) async {
    print("Date received: $date");
    String id = DateTime.now().toString();
    late DateTime parsedDate;

    try {
      try {
        parsedDate = DateTime.parse(date);
      } catch (e) {
        parsedDate = DateFormat("d MMM yyyy").parse(date);
      }

      final result = Revencesalemodels(
        orderid: "",
        totalorders: orders.length,
        totalrevene: amount,
        id: id,
        date: date,
        year: parsedDate.year.toString(),
        month: parsedDate.month.toString(),
      );

      await orderrepositry.createsalesdashboard(result, id);
      print("Success");
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2025, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && selectedvalue != picked) {
      selectedvalue = picked;

      print("WORIKNG:_$selectedvalue");
      fetchDailyRevenue(picked);
    }
  }

  Future<void> fetchDailyRevenue(DateTime date) async {
    try {
      String formattedDate = DateFormat("d MMM yyyy").format(date);
      print("SATEVJAHD:-$formattedDate");
      final data =
          await _db
              .collection("SalesRevenuve")
              .where("date", isEqualTo: formattedDate)
              .get();
      double total = 0;
      int index = 0;
      dailynewRevenuespo.clear();
      for (var doc in data.docs) {
        total += doc["totalrevene"];
        int totlarev = doc["totalrevene"];
        dailynewRevenuespo.add(FlSpot(index.toDouble(), totlarev.toDouble()));
        index++;
      }

      print("ASjdkNdd:$dailyRevenuespots");
      dailyRevenuespots.assignAll(dailynewRevenuespo);
      totalRevenue.value = total;
      totalOrders.value = data.docs.length;
    } catch (e) {
      print("DATE ERROR IS :-$e");
    }
  }

  RxDouble totalmontreveb = 0.0.obs;
  var totalorderinmonth = 0.obs;
  Future<void> selectMonth(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,

      firstDate: DateTime(2025, 1),
      lastDate: DateTime(2030, 12),
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(Duration(days: 7)),
        end: DateTime.now(),
      ),
    );
    if (picked != null) {
      await fetchMonthlyRevene(picked.start, picked.end);
    }
  }

  Future<void> fetchMonthlyRevene(DateTime startdate, DateTime enddate) async {
    try {
      String startFormatted = DateFormat("dd MMM yyyy").format(startdate);
      String endFormatted = DateFormat("dd MMM yyyy").format(enddate);
      print("START$startFormatted");
      print("END:$endFormatted");
      final data =
          await _db
              .collection("SalesRevenuve")
              .where("date", isGreaterThanOrEqualTo: startFormatted)
              .where("date", isLessThanOrEqualTo: endFormatted)
              .get();

      double totall = 0;
      newSpotsList.clear();
      for (var doc in data.docs) {
        totall += doc["totalrevene"];
        String date = doc["date"];
        int revenue = doc["totalrevene"];
        DateTime parsedDate = DateFormat("dd MMM yyyy").parse(date);
        newSpotsList.add(FlSpot(parsedDate.day.toDouble(), revenue.toDouble()));
      }
      revenueSpots.assignAll(newSpotsList);
      // newSpotsList.sort((a, b) => a.x.compareTo(b.x));

      totalmontreveb.value = totall;
      totalorderinmonth.value = data.docs.length;
    } catch (e) {
      print("Error in monthly range fetch: $e");
    }
  }
}
