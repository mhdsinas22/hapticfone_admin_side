import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hapticadmin/featuers/store/controllers/sale_revenue_controller.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';

class RevenueLineChart extends StatelessWidget {
  const RevenueLineChart({
    super.key,
    required this.isdaily,
    required this.spots,
  });
  final bool isdaily;
  final List<FlSpot> spots;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child:
          spots.isEmpty
              ? Center(child: Text("No Data Available"))
              : Obx(
                () => LineChart(
                  LineChartData(
                    lineBarsData: [
                      isdaily
                          ? _buildLineChartBarDataDaliy()
                          : _buildLineChartBarData(),
                    ],
                  ),
                ),
              ),
    );
  }

  LineChartBarData _buildLineChartBarData() {
    final reveneceslaecontroller = Get.find<Salesrevnecontroller>();
    return LineChartBarData(
      barWidth: 2,
      color: const Color.fromRGBO(188, 234, 114, 1),
      spots: reveneceslaecontroller.revenueSpots,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            Appcolors.appbuttongreen,
            const Color.fromARGB(255, 136, 193, 15).withOpacity(0.0),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildLineChartBarDataDaliy() {
    final reveneceslaecontroller = Get.find<Salesrevnecontroller>();
    return LineChartBarData(
      barWidth: 2,
      color: const Color.fromRGBO(188, 234, 114, 1),
      spots: reveneceslaecontroller.dailyRevenuespots,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            Appcolors.appbuttongreen,
            const Color.fromARGB(255, 136, 193, 15).withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
