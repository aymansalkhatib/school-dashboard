import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';

class AvatarWithBackground extends StatelessWidget {
  const AvatarWithBackground({
    super.key,
    required this.constraints,
    required this.mask,
  });
  final BoxConstraints constraints;
  final String mask;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
        width: double.infinity,
        height: constraints.maxHeight / 3,
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
