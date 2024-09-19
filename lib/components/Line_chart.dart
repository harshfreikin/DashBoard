import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section for the Line Chart
        Row(
          children: [
            Text(
              "Over All Performance\nThe Years",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Spacer(),
            // Adding the legend for "Pending" and "Project Done"
            Row(
              children: [
                _buildLegendItem(Colors.pinkAccent, "Pending"),
                SizedBox(width: 10),
                _buildLegendItem(Colors.blueAccent, "Project Done"),
              ],
            ),
          ],
        ),
        SizedBox(height: 10), // Space between title and chart
        SizedBox(
          height: 250, // Height of the chart
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 1:
                          return Text('2015');
                        case 2:
                          return Text('2016');
                        case 3:
                          return Text('2017');
                        case 4:
                          return Text('2018');
                        case 5:
                          return Text('2019');
                        case 6:
                          return Text('2020');
                        case 7:
                          return Text('2021');
                        case 8:
                          return Text('2022');
                        case 9:
                          return Text('2023');
                        default:
                          return Text('');
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 10,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toInt().toString());
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              minX: 1,
              maxX: 9,
              minY: 0,
              maxY: 55,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(1, 20),
                    FlSpot(2, 30),
                    FlSpot(3, 25),
                    FlSpot(4, 40),
                    FlSpot(5, 30),
                    FlSpot(6, 45),
                    FlSpot(7, 35),
                    FlSpot(8, 20),
                    FlSpot(9, 55), // 2023
                  ],
                  isCurved: true,
                  color: Colors.pinkAccent,
                  barWidth: 4,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.pinkAccent.withOpacity(0.3),
                  ),
                ),
                LineChartBarData(
                  spots: [
                    FlSpot(1, 10),
                    FlSpot(2, 20),
                    FlSpot(3, 15),
                    FlSpot(4, 30),
                    FlSpot(5, 25),
                    FlSpot(6, 35),
                    FlSpot(7, 30),
                    FlSpot(8, 15),
                    FlSpot(9, 40), // 2023
                  ],
                  isCurved: true,
                  color: Colors.blueAccent,
                  barWidth: 4,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.blueAccent.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Function to build legend items
  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
