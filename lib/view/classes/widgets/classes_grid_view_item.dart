import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sama/controller/classes_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/class_model.dart';

class ClassesGridViewItem extends StatelessWidget {
  const ClassesGridViewItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        AppColors.primaryPurple,
        AppColors.primaryPurple,
      ],
    );

    return GetBuilder<ClassesControllerImp>(builder: (controller) {
      return InkWell(
        onTap: () => controller.changeIndex(index),
        borderRadius: BorderRadius.circular(22.5),
        highlightColor: AppColors.textBlack,
        splashColor: AppColors.textBlack,
        hoverColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: controller.isActive == index
                ? AppColors.primaryPurple
                : Colors.transparent,
            borderRadius: BorderRadius.circular(22.5),
          ),
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding:
                EdgeInsets.symmetric(vertical: 70.0 * getScaleFactor(context)),
            child: ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(
                0,
                0,
                bounds.width,
                bounds.height,
              )),
              child: Image.asset(
                classesModel[index].image,
                color: AppColors.backgroundWhite,
              ),
            ),
          ),
        ),
      );
    });
  }
}
