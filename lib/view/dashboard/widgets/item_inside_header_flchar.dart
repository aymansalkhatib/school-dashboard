import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class ItemInsideHeaderFlchar extends StatelessWidget {
  const ItemInsideHeaderFlchar({
    super.key,
    required this.text,
    required this.number,
    required this.colorCircle,
  });
  final String text;
  final double number;
  final Color colorCircle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 12 * getScaleFactor(context),
              height: 12 * getScaleFactor(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorCircle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8 * getScaleFactor(context)),
            Text(
              text,
              style: AppFontStyle.styleRegular14(context).copyWith(
                  color: AppColors.darkGray,
                  fontSize: 14 * getScaleFactor(context)),
            ),
          ],
        ),
        Text(
          number.toString(),
          style: AppFontStyle.styleBold18(context)
              .copyWith(fontSize: 18 * getScaleFactor(context)),
        ),
      ],
    );
  }
}
