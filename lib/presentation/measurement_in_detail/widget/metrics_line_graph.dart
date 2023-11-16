import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watcha_body/constants/theme.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class MetricsLineGraph extends StatelessWidget {
  const MetricsLineGraph({
    super.key,
    required this.measurements,
  });

  final List<Measurement> measurements;

  @override
  Widget build(BuildContext context) {
    // Convert data to FlSpot
    // final flSpots = <FlSpot>[];
    // for (var i = 0; i < measurements.length; i++) {
    //   flSpots.add(
    //     FlSpot(
    //       measurements[i].date.millisecondsSinceEpoch.toDouble(),
    //       measurements[i].value,
    //     ),
    //   );
    // }

    // final minY = measurements.reduce(
    //   (value, element) => value.value < element.value ? value : element,
    // );
    // final maxY = measurements.reduce(
    //   (value, element) => value.value > element.value ? value : element,
    // );

    // print(flSpots.toString());

    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            horizontalInterval: 1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                // color: kPrimaryLightFont,
                color: Colors.grey.shade50,
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                // color: kPrimaryLightFont,

                color: Colors.grey.shade50,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
                // getTitlesWidget: (value, meta) {
                //   return SideTitleWidget(
                //       child: Text(value.toString()), axisSide: meta.axisSide);
                // },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 32,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey),
          ),
          // minX: 1,
          // maxX: 30,
          // minY: minY.value,
          // maxY: maxY.value,
          lineBarsData: [
            LineChartBarData(
              // spots: flSpots,
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              barWidth: 2,
              // isStrokeCapRound: true,
              color: kPrimaryColorInDark,
              dotData: const FlDotData(
                show: true,
              ),
              belowBarData: BarAreaData(
                show: false,
                // gradient: LinearGradient(
                //   colors: gradientColors
                //       .map((color) => color.withOpacity(0.3))
                //       .toList(),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10K';
      break;
    case 3:
      text = '30k';
      break;
    case 5:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              // showAvg ? avgData() : mainData(),
              // avgData(),
              mainData(),
            ),
          ),
        ),
        // SizedBox(
        //   width: 60,
        //   height: 34,
        //   child: TextButton(
        //     onPressed: () {
        //       setState(() {
        //         showAvg = !showAvg;
        //       });
        //     },
        //     child: Text(
        //       'avg',
        //       style: TextStyle(
        //         fontSize: 12,
        //         color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: kPrimaryLightFont,
            color: Colors.grey.shade50,
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            // color: kPrimaryLightFont,

            color: Colors.grey.shade50,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey),
      ),
      // minX: 0,
      // maxX: 11,
      // minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          barWidth: 2,
          // isStrokeCapRound: true,
          color: kPrimaryColorInDark,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            // ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: false,
        verticalInterval: 1,
        horizontalInterval: 1,
        drawVerticalLine: false,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          barWidth: 1,
          isStrokeCapRound: true,
          // color: Colors.red,
          // dashArray: [5, 10],
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true, color: Colors.amber,
            // gradient: LinearGradient(
            //   colors: [
            //     ColorTween(begin: gradientColors[0], end: gradientColors[1])
            //         .lerp(0.2)!
            //         .withOpacity(0.1),
            //     ColorTween(begin: gradientColors[0], end: gradientColors[1])
            //         .lerp(0.2)!
            //         .withOpacity(0.1),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
