import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.colorText,
    this.color,
    this.onPressed,
  });

  final String text;
  final Color? colorText;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColors.primaryPurple, width: 2)),
      color: color ?? Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppFontStyle.styleRegular18(context).copyWith(color: colorText ?? AppColors.textBlack),
        ),
      ),
    );
  }
}
