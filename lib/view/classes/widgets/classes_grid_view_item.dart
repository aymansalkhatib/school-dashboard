import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/class_model.dart';

class ClassesGridViewItem extends StatelessWidget {
  const ClassesGridViewItem({
    super.key,
    required this.classModel,
    required this.isActive,
  });
  final ClassModel classModel;
  final bool isActive;
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

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(22.5),
      highlightColor: AppColors.textBlack,
      splashColor: AppColors.textBlack,
      hoverColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(22.5),
        ),
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 70.0 * getScaleFactor(context)),
          child: ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(
              0,
              0,
              bounds.width,
              bounds.height,
            )),
            child: Image.asset(
              classModel.image,
              color: AppColors.backgroundWhite,
            ),
          ),
        ),
      ),
    );
  }
}
