import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color leftBarColor = AppColors.highlightYellow;
  final Color rightBarColor = AppColors.errorRed;
  final Color avgColor = AppColors.accentOrange.avg(AppColors.errorRed);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  double width = 10;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 50, 90, width);
    final barGroup2 = makeGroupData(1, 16, 80, width);
    final barGroup3 = makeGroupData(2, 18, 50, width);
    final barGroup4 = makeGroupData(3, 20, 55, width);
    final barGroup5 = makeGroupData(4, 89, 6, width);
    final barGroup6 = makeGroupData(5, 19, 98, width);
    final barGroup7 = makeGroupData(6, 3, 20, width);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    final double scale = (1 - MediaQuery.sizeOf(context).width / 1600) * 20;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(32 * getScaleFactor(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const HeaderFlChar(),
          SizedBox(height: 38 * getScaleFactor(context)),
          AspectRatio(
            aspectRatio: 1.245,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 37 - scale, bottom: 20, right: 10 - scale),
                  child: CustomPaint(
                    painter: CustomGridLinePainter(
                      numberHorizontalLines: 6,
                      numberVerticalLines: 8,
                      color: AppColors.darkGray,
                    ),
                    child: const Center(),
                  ),
                ),
                BarChart(
                  BarChartData(
                    maxY: 100,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return null;
                        },
                      ),
                      touchCallback: (FlTouchEvent event, response) {
                        if (response == null || response.spot == null) {
                          setState(() {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          });
                          return;
                        }

                        touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                        setState(() {
                          if (!event.isInterestedForInteractions) {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                            return;
                          }
                          showingBarGroups = List.of(rawBarGroups);
                          if (touchedGroupIndex != -1) {
                            var sum = 0.0;
                            for (final rod in showingBarGroups[touchedGroupIndex].barRods) {
                              sum += rod.toY;
                            }
                            final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;

                            showingBarGroups[touchedGroupIndex] =
                                showingBarGroups[touchedGroupIndex].copyWith(
                              barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                return rod.copyWith(toY: avg, color: widget.avgColor);
                              }).toList(),
                            );
                          }
                        });
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 20,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          interval: 1,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: const FlGridData(
                      show: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta, {double max = 100}) {
    String text;

    if (value == 2) {
      text = '1K';
    } else if (value == 22) {
      text = '20k';
    } else if (value == 42) {
      text = '40k';
    } else if (value == 62) {
      text = '60K';
    } else if (value == 82) {
      text = '80K';
    } else if (value == 100) {
      text = '100k';
    } else {
      return Container();
    }
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 0,
        child: Text(
          text,
          style: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray),
        ));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double width) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: AppColors.primaryPurple.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: AppColors.primaryPurple.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: AppColors.primaryPurple.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: AppColors.primaryPurple.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: AppColors.primaryPurple.withOpacity(0.4),
        ),
      ],
    );
  }
}

class HeaderFlChar extends StatelessWidget {
  const HeaderFlChar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "School Finance",
          style: AppFontStyle.styleBold24(context).copyWith(fontSize: 24 * getScaleFactor(context)),
        ),
        SizedBox(width: 20 * getScaleFactor(context)),
        const Row(
          children: [
            ItemInsideHeaderFlchar(
              colorCircle: AppColors.highlightYellow,
              number: 1.245,
              text: "This Week",
            ),
            SizedBox(width: 16),
            ItemInsideHeaderFlchar(
              colorCircle: AppColors.errorRed,
              number: 1.356,
              text: "Last Week",
            ),
          ],
        ),
      ],
    );
  }
}

class ItemInsideHeaderFlchar extends StatelessWidget {
  const ItemInsideHeaderFlchar({
    super.key,
    required this.text,
    required this.number,
    required this.colorCircle,
  });
  final String text;
  final double number;
  final Color colorCircle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 6 * getScaleFactor(context),
              backgroundColor: colorCircle,
              child: CircleAvatar(
                radius: 3 * getScaleFactor(context),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 8 * getScaleFactor(context)),
            Text(
              text,
              style: AppFontStyle.styleRegular14(context)
                  .copyWith(color: AppColors.darkGray, fontSize: 14 * getScaleFactor(context)),
            ),
          ],
        ),
        Text(
          number.toString(),
          style: AppFontStyle.styleBold18(context).copyWith(fontSize: 18 * getScaleFactor(context)),
        ),
      ],
    );
  }
}

extension ColorExtension on Color {
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}

class CustomGridLinePainter extends CustomPainter {
  final int numberVerticalLines;
  final int numberHorizontalLines;
  final double strokeWidth;
  final Color color;

  CustomGridLinePainter(
      {this.numberVerticalLines = 2,
      this.numberHorizontalLines = 2,
      this.strokeWidth = 1.0,
      this.color = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    final double cellWidth = size.width / (numberVerticalLines - 1);
    final double cellHeight = size.height / (numberHorizontalLines - 1);

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < numberHorizontalLines; i++) {
      double y = i * cellHeight;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (int i = 0; i < numberVerticalLines; i++) {
      double x = i * cellWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
