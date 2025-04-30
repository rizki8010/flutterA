import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrafficChart extends StatelessWidget {
  final List<Map<String, dynamic>> trafficData;

  const TrafficChart({super.key, required this.trafficData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY:
              (trafficData
                          .map((e) => e['count'] as int)
                          .reduce((a, b) => a > b ? a : b) +
                      2)
                  .toDouble(),
          barGroups:
              trafficData.asMap().entries.map((entry) {
                final index = entry.key;
                final data = entry.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: (data['count'] as int).toDouble(),
                      width: 16,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          Color(0xFF3E54AC).withOpacity(0.8), // biru ke ungu
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ],
                );
              }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  int index = value.toInt();
                  if (index >= 0 && index < trafficData.length) {
                    return Text(
                      trafficData[index]['month'],
                      style: const TextStyle(fontSize: 10),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 28),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }
}
