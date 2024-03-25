import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class ImageWithNameStudent extends StatelessWidget {
  const ImageWithNameStudent({
    super.key,
    this.path,
  });
  final String? path;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 55 * getScaleFactor(context),
              height: 55 * getScaleFactor(context),
              color: AppColors.lightPurple,
              child: path != null && (path ?? '').isNotEmpty
                  ? Image.file(
                      File(path!),
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              key: const Key("value"),
              "Samanta William",
              overflow: TextOverflow.ellipsis,
              style: AppFontStyle.styleBold18(Get.context!),
            ),
          ),
        ),
        SizedBox(width: 20 * getScaleFactor(context)),
      ],
    );
  }
}
