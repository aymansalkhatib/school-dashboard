import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';

class ScheduleDetailsModel {
  final Color prefixColor;
  final String title;
  final String subtitle;
  final String date;
  final String time;

  ScheduleDetailsModel(
      {required this.prefixColor,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.time});
}

List<ScheduleDetailsModel> scheduleDetailsModel = [
  ScheduleDetailsModel(
    prefixColor: AppColors.primaryPurple,
    title: "World History",
    subtitle: "Class VII-B",
    date: "March 20, 2021",
    time: "09.00 - 10.00 AM",
  ),
  ScheduleDetailsModel(
    prefixColor: AppColors.accentOrange,
    title: "Ancient History",
    subtitle: "Class VII-A",
    date: "March 20, 2021",
    time: "09.00 - 10.00 AM",
  ),
  ScheduleDetailsModel(
    prefixColor: AppColors.highlightYellow,
    title: "Culture",
    subtitle: "Class VIII-A",
    date: "March 20, 2021",
    time: "09.00 - 10.00 AMq",
  ),
  ScheduleDetailsModel(
    prefixColor: AppColors.textBlack,
    title: "World History",
    subtitle: "Class VII-C",
    date: "March 20, 2021",
    time: "09.00 - 10.00 AMq",
  ),
];
