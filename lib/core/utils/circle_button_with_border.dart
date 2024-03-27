import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class CircleButtonWithBorder extends StatelessWidget {
  const CircleButtonWithBorder({
    super.key,
    required this.icon,
    this.image,
  });
  final IconData icon;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164 * getScaleFactor(context),
      height: 164 * getScaleFactor(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Container(
          margin: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 221, 223, 248),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image != null && (image ?? '').isNotEmpty
                ? Image.file(
                    File(image!),
                    fit: BoxFit.cover,
                  )
                : Icon(
                    icon,
                    color: AppColors.primaryPurple,
                    size: 80 * getScaleFactor(context),
                  ),
          )),
    );
  }
}
