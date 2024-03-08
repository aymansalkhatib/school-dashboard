import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppFontStyle.styleRegular18(context),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Search here ...",
        contentPadding: const EdgeInsets.all(0),
        hintStyle: AppFontStyle.styleRegular18(context).copyWith(
          color: AppColors.darkGray,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SvgPicture.asset(
            Assets.iconsSearch,
            width: 32 * getScaleFactor(context),
            height: 32 * getScaleFactor(context),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
