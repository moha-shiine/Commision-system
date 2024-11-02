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
            Card(
              child: Container(
                height: 80,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(IconlyLight.home),
                      Gap(50),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: VerticalDivider(),
                      ),
                      Gap(10),
                      Icon(IconlyBold.home, color: Colors.blue),
                      Gap(10),
                      Text(
                        "Paid",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Gap(30),
                      Icon(
                        IconlyLight.paper,
                        color: Colors.grey,
                      ),
                      Gap(10),
                      Text(
                        "UnPaid",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text("Eng"),
                      Gap(10),
                      Icon(Icons.notification_add),
                      Gap(10),
                      Text("shiine"),
                      Gap(30),
                      CircleAvatar(
                          maxRadius: 30,
                          child: Center(child: Icon(Icons.person)))
                    ],
                  ),
                ),
              ),
            ),
            Gap(40),
            Text(
              "Dashboard ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Gap(20),
            cardWidget(),
            Gap(20),
            SizedBox(
              height: 400,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(),
                  titlesData: FlTitlesData(
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 40),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
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
                          show: true, color: Colors.blue.withOpacity(0.3)),
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

  cardWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BuildCard("Agency", "1003", Icons.category, Colors.green, "Hide"),
        _BuildCard(
            "Orders", "303", Icons.send_and_archive, Colors.blue, "Hide"),
        _BuildCard("Product", "10303", Icons.shop, Colors.pink, "Hide"),
        _BuildCard(
            "Commision", "103", Icons.price_change, Colors.amber, "Hide"),
      ],
    );
  }

  Widget _BuildCard(
      String title, String value, IconData icon, Color color, String Hide) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),

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
              Gap(10),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Gap(20),
              // Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
