import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/utils/custom_search.dart';

class UsersHeader extends StatelessWidget {
  const UsersHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "User Dashboard",
          style: AppFontStyle.styleBold36(context).copyWith(height: 1),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            width: 350 * getScaleFactor(context),
            child: const CustomSearch(),
          ),
        ),
      ],
    );
  }
}
