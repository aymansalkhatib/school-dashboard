import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/model/student_model.dart';

class ImageWithNameStudent extends StatelessWidget {
  const ImageWithNameStudent({
    super.key,
    required this.studentModel,
  });
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              width: 55 * getScaleFactor(context),
              height: 55 * getScaleFactor(context),
              // color: AppColors.lightPurple,
              child: studentModel.image != null &&
                      (studentModel.image ?? '').isNotEmpty
                  ? Image.file(
                      File(studentModel.image!),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(Assets.imagesStudentDefault),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${studentModel.firstName} ${studentModel.lastName}',
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
