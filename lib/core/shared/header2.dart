import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/custom_button.dart';
import 'package:sama/core/shared/custom_drop_down.dart';
import 'package:sama/core/utils/custom_search.dart';
// import 'package:sama/core/shared/custom_search.dart';

class Header2 extends StatelessWidget {
  const Header2({super.key, this.text = "+ New Student",this.onPressed1, this.onPressed2});

  final String text;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Expanded(child: CustomSearch()),
          const Spacer(),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            onPressed: onPressed2,
            elevation: 0,
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                borderSide: BorderSide(width: 2, color: AppColors.primaryPurple)),
            color: Colors.white,
            child: Center(
              child: Row(
                children: [
                  Text(
                    "   Newest  ",
                    style: AppFontStyle.styleRegular18(context).copyWith(color: AppColors.textBlack),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Dropdown(
                    angle: 0,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomButton(
            text: text,
            color: AppColors.primaryPurple,
            colorText: Colors.white,
            onPressed: onPressed1,
          ),
        ],
      ),
    );
  }
}
