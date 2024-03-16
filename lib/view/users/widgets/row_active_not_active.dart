import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class RowActiveAndNotActive extends StatelessWidget {
  const RowActiveAndNotActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.primaryPurple,
            ),
            const SizedBox(width: 8),
            Text(
              "Actiive",
              style: AppFontStyle.styleMedium16(context),
            ),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.accentOrange,
            ),
            const SizedBox(width: 8),
            Text(
              "Not Active",
              style: AppFontStyle.styleMedium16(context),
            ),
          ],
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
