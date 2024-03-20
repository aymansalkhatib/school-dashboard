import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/view/view_all_student/widgets/contact_student.dart';
import 'package:sama/view/view_all_student/widgets/image_with_name_student.dart';

class ItemTableStudents extends StatelessWidget {
  const ItemTableStudents({super.key});

  Widget fittedText(String text, {TextStyle? style}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: style ?? AppFontStyle.styleRegular14(Get.context!),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: ImageWithNameStudent(),
          ),
          Expanded(
            flex: 2,
            child: fittedText(
              "#123456789",
              style: AppFontStyle.styleSemiBold18(Get.context!).copyWith(color: AppColors.primaryPurple),
            ),
          ),
          Expanded(
            flex: 2,
            child: fittedText(
              "March 25, 2021",
              style: AppFontStyle.styleRegular14(Get.context!).copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: fittedText("Mana William"),
          ),
          Expanded(
            flex: 2,
            child: fittedText("Jakarta Jakarta"),
          ),
          const Expanded(
            flex: 2,
            child: ContactStudent(),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 40 * getScaleFactor(context),
                width: 90 * getScaleFactor(context),
                decoration: BoxDecoration(
                  color: AppColors.accentOrange,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "VII A",
                    style: AppFontStyle.styleRegular16(context, lower: 0.7).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20 * getScaleFactor(context)),
          SizedBox(
            width: 45,
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                Assets.iconsDots,
                width: 24 * getScaleFactor(context),
                height: 24 * getScaleFactor(context),
                colorFilter: const ColorFilter.mode(AppColors.darkGray, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
