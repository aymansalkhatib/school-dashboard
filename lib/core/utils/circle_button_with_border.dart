import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class CircleButtonWithBorder extends StatelessWidget {
  const CircleButtonWithBorder({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164 * getScaleFactor(context),
      height: 164 * getScaleFactor(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 221, 223, 248),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryPurple,
            size: 80 * getScaleFactor(context),
          ),
        ),
      ),
    );
  }
}
