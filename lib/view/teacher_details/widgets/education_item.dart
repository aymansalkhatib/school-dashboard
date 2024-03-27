import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class EducationItem extends StatelessWidget {
  const EducationItem({
    super.key,
    required this.title,
    required this.body,
  });
  final String title, body;
  @override
  Widget build(BuildContext context) {
    const double radius = 2.5;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 12),
            const CircleAvatar(
                radius: radius, backgroundColor: AppColors.primaryPurple),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppFontStyle.styleMedium18(context, lower: 0.7),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 22 + radius * 2),
            Text(
              body,
              style: AppFontStyle.styleRegular18(context, lower: 0.7).copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
