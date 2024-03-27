import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class CustomTextFromFeild extends StatelessWidget {
  const CustomTextFromFeild(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.controller,
      this.validator});
  final TextEditingController? controller;

  final String hint;
  final int maxLines;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      style: AppFontStyle.styleRegular18(context)
          .copyWith(color: AppColors.textBlack),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.zero.copyWith(left: 10, right: 10, top: 20, bottom: 5),
          hintText: hint,
          hintStyle: AppFontStyle.styleRegular16(context)
              .copyWith(color: AppColors.darkGray, height: 1.2),
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: Color(0xffC1BBEB), width: 1.5))),
    );
  }
}
