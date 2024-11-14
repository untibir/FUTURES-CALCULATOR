import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/coin.dart';
// Qrafiki yaradan funksiya

class qrafik_home extends StatelessWidget {
  const qrafik_home({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 170,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 3,
          minY: coin.currentPrice * 0.3,
          maxY: coin.currentPrice * 1.2,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, coin.priceChange3h ?? coin.currentPrice),
                FlSpot(1, coin.priceChange1h ?? coin.currentPrice),
                FlSpot(2, coin.previousPrice ?? coin.currentPrice),
                FlSpot(3, coin.currentPrice),
              ],
              isCurved: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
