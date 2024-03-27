import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/view/dashboard/widgets/item_inside_header_flchar.dart';

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
          style: AppFontStyle.styleBold24(context)
              .copyWith(fontSize: 24 * getScaleFactor(context)),
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
