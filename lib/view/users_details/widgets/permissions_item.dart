import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class PermissionsItem extends StatelessWidget {
  const PermissionsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
  });
  final String icon;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 32,
          color: AppColors.primaryPurple,
        ),
        const SizedBox(width: 8),
        Text(title, style: AppFontStyle.styleMedium18(context)),
        const Spacer(),
        CircleAvatar(
          radius: 15,
          backgroundColor:
              isActive ? AppColors.primaryPurple : AppColors.errorRed,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 13,
            child: Icon(
              isActive ? Icons.check : Icons.clear,
              color: isActive ? AppColors.primaryPurple : AppColors.errorRed,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}

//* 1 add and change mark
//* 2 add student and change
//* 3 add selling and change
