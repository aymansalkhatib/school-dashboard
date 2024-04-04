import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/utils/size_config.dart';

class AppFontStyle {
  //* [ Regular ]
  static TextStyle styleRegular14(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 14, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular15(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular16(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 16, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular18(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 18, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular49(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 49),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  //* [ Medium ]
  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium18(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 18, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  //* [ SemiBold ]
  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold32(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold28(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold15_5(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 15.5),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 18, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold24(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 24, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  //* [ Bold ]
  static TextStyle styleBold32(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 32, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold36(BuildContext context, {double? lower}) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 36, lower: lower),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold38(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 38),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      color: AppColors.textBlack,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize, double? lower, double? upper}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = lower != null ? fontSize * lower : fontSize * .8;
  double upperLimit = upper != null ? fontSize * upper : fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1200;
  } else {
    return width / 1920;
  }
}
