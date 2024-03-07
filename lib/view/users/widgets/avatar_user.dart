import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164 * getScaleFactor(context),
      height: 164 * getScaleFactor(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          width: 164 * getScaleFactor(context) - 10,
          height: 164 * getScaleFactor(context) - 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.lightBlue,
          ),
        ),
      ),
    );
  }
}
