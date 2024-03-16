import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class HeaderTrailingTeacher extends StatelessWidget {
  const HeaderTrailingTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 386 / 129,
      child: Container(
        padding: EdgeInsets.all(24 * getScaleFactor(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Schedule Details",
                style: AppFontStyle.styleBold24(context).copyWith(
                  fontSize: 24 * getScaleFactor(context),
                ),
              ),
            ),
            const Spacer(flex: 3),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Thursday, 10th April , 2021",
                style: AppFontStyle.styleMedium14(context).copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
