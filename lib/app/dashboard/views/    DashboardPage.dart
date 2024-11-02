import 'package:commision_system/app/login/widgets/heardCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // headerCard(true
            //   titel: "Home",
            // ),
            HeaderCard(title: "Home", showIcon: false),
            Gap(40),
            Text(
              "Dashboard ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Gap(20),
            cardWidget(context),
            Gap(20),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Users",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Spacer(),
                        Text(
                          "Sort by:",
                          style: TextStyle(color: Colors.black),
                        ),
                        Gap(5),
                        Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "year",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Icon(IconlyLight.arrowDown2,
                                  size: 16, color: Colors.white)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Gap(30),
                  SizedBox(
                    height: 400,
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(),
                        titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 30),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                // Define month labels for each index
                                const monthNames = [
                                  'Jan',
                                  'Feb',
                                  'Mar',
                                  'Apr',
                                  'May',
                                  'Jun',
                                  'Jul',
                                  'Aug',
                                  'Sep',
                                  'Oct',
                                  'Nov',
                                  'Dec'
                                ];

                                String monthLabel;
                                if (value.toInt() >= 0 &&
                                    value.toInt() < monthNames.length) {
                                  monthLabel = monthNames[value.toInt()];
                                } else {
                                  monthLabel =
                                      ''; // Blank for values outside the range
                                }

                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    monthLabel,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                );
                              },
                              interval: 1, // Show label at every month point
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                        gridData: FlGridData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(1, 2),
                              FlSpot(2, 5),
                              FlSpot(3, 3.1),
                              FlSpot(4, 4),
                              FlSpot(5, 3),
                              FlSpot(6, 4),
                              FlSpot(7, 3.5),
                              FlSpot(8, 4.2),
                              FlSpot(9, 3.8),
                              FlSpot(10, 4.6),
                              FlSpot(11, 4),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            // barWidth: 2,
                            belowBarData: BarAreaData(
                                show: true,
                                color: Colors.blue.withOpacity(0.3)),
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        minX: 0,
                        maxX: 11,
                        minY: 0,
                        maxY: 6,
                      ),
                    ),
                  ),
                  Gap(10)
                ],
              ),
            ),
            Gap(80),
            //  Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Pricvcy Policy"),
                    Gap(10),
                    Text("And Term Use"),
                    Spacer(),
                    Text("Adwaar Technolgy")
                  ],
                ),
              ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(BuildContext context) {
    // Determine the cross-axis count based on screen width
    int crossAxisCount = MediaQuery.of(context).size.width < 600 ? 2 : 4;

    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 2.1, // Adjust as needed
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5,
        shrinkWrap: true,
        physics:
            NeverScrollableScrollPhysics(), // Disable scroll if inside another scrollable
        children: [
          _BuildCard("Agency", "1003", Icons.category, Colors.green, "Hide"),
          _BuildCard(
              "Orders", "303", Icons.send_and_archive, Colors.blue, "Hide"),
          _BuildCard("Product", "10303", Icons.shop, Colors.pink, "Hide"),
          _BuildCard(
              "Commission", "103", Icons.price_change, Colors.amber, "Hide"),
        ],
      ),
    );
  }

  Widget _BuildCard(
      String title, String value, IconData icon, Color color, String Hide) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Text(
                  Hide,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Gap(6),
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Gap(10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            //  Gap(20),
            // Spacer()
          ],
        ),
      ),
    );
  }
}
