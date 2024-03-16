import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';

class AvatarWithBackground extends StatelessWidget {
  const AvatarWithBackground({
    super.key,
    required this.height,
    required this.mask,
  });
  final double height;
  final String mask;
  @override
  Widget build(BuildContext context) {
    double top = 32 * MediaQuery.sizeOf(context).width / 1700;
    return Container(
        padding: EdgeInsets.only(left: 32, top: top, right: top),
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            mask,
          ),
        ));
  }
}
