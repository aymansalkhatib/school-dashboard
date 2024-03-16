import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class TrailingDashboardSectionStudent extends StatelessWidget {
  const TrailingDashboardSectionStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Students',
                  textAlign: TextAlign.left,
                  style: AppFontStyle.styleBold24(context),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'You have 456 students',
                  textAlign: TextAlign.left,
                  style: AppFontStyle.styleRegular14(context).copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 53),
        Container(
          width: 52 * getScaleFactor(context),
          height: 52 * getScaleFactor(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.primaryPurple,
          ),
          child: const Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
            size: 22,
          )),
        ),
      ],
    );
  }
}
