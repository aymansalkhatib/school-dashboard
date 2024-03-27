import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/assets.dart';

class DashboardItemModel {
  final String text;
  final int number;
  final String icon;
  final Color color;

  DashboardItemModel(
      {required this.text,
      required this.number,
      required this.icon,
      required this.color});
}

List<DashboardItemModel> dashboardItemsModel = [
  DashboardItemModel(
    text: "Students",
    number: 932,
    icon: Assets.iconsStudent,
    color: AppColors.primaryPurple,
  ),
  DashboardItemModel(
    text: "Teachers",
    number: 754,
    icon: Assets.iconsTeacher,
    color: AppColors.accentOrange,
  ),
  DashboardItemModel(
    text: "Events",
    number: 40,
    icon: Assets.iconsCalendar,
    color: AppColors.highlightYellow,
  ),
  DashboardItemModel(
    text: "Students",
    number: 32,
    icon: Assets.iconsFood,
    color: AppColors.textBlack,
  ),
];
