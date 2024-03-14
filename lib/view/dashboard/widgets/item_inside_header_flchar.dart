import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';

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
            CircleAvatar(
              radius: 6 * getScaleFactor(context),
              backgroundColor: colorCircle,
              child: CircleAvatar(
                radius: 3 * getScaleFactor(context),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 8 * getScaleFactor(context)),
            Text(
              text,
              style: AppFontStyle.styleRegular14(context)
                  .copyWith(color: AppColors.darkGray, fontSize: 14 * getScaleFactor(context)),
            ),
          ],
        ),
        Text(
          number.toString(),
          style: AppFontStyle.styleBold18(context).copyWith(fontSize: 18 * getScaleFactor(context)),
        ),
      ],
    );
  }
}
