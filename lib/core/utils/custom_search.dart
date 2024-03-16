import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: max(60 * getScaleFactor(context), 45),
      child: TextFormField(
        style: AppFontStyle.styleRegular18(context),
        decoration: InputDecoration(
          hoverColor: Colors.white,
          filled: true,
          fillColor: Colors.white,
          hintText: " Search here ...",
          contentPadding: const EdgeInsets.all(0),
          hintStyle: AppFontStyle.styleRegular18(context).copyWith(
            color: AppColors.darkGray,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SvgPicture.asset(
              Assets.iconsSearch,
              width: 20 * getScaleFactor(context),
              height: 20 * getScaleFactor(context),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
