import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/helper/color_extention.dart';
import 'package:sama/core/helper/custom_grid_painter.dart';
import 'package:sama/view/dashboard/widgets/header_flchar.dart';

class FlChar extends StatefulWidget {
  FlChar({super.key});
  final Color leftBarColor = AppColors.highlightYellow;
  final Color rightBarColor = AppColors.errorRed;
  final Color avgColor = AppColors.accentOrange.avg(AppColors.errorRed);
  @override
  State<StatefulWidget> createState() => FlCharState();
}

class FlCharState extends State<FlChar> {
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
                  padding: EdgeInsets.only(
                      left: 37 - scale, bottom: 20, right: 10 - scale),
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
                            for (final rod
                                in showingBarGroups[touchedGroupIndex]
                                    .barRods) {
                              sum += rod.toY;
                            }
                            final avg = sum /
                                showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .length;

                            showingBarGroups[touchedGroupIndex] =
                                showingBarGroups[touchedGroupIndex].copyWith(
                              barRods: showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .map((rod) {
                                return rod.copyWith(
                                    toY: avg, color: widget.avgColor);
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
          style: AppFontStyle.styleRegular16(context)
              .copyWith(color: AppColors.darkGray),
        ));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: AppFontStyle.styleRegular16(context)
          .copyWith(color: AppColors.darkGray),
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
}
