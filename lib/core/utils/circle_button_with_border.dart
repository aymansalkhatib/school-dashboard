import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';

class CircleButtonWithBorder extends StatelessWidget {
  const CircleButtonWithBorder({
    super.key,
    required this.imageDefault,
    this.image,
  });
  final String imageDefault;
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
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image != null && (image ?? '').isNotEmpty
                ? Image.file(
                    File(image!),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    imageDefault,
                    fit: BoxFit.cover,
                  ),
          )),
    );
  }
}
