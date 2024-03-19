import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/custom_disconnect_contaniar.dart';

class ImageWithTitleInsideDetailsStudent extends StatelessWidget {
  const ImageWithTitleInsideDetailsStudent({
    super.key,
    this.width,
    this.height,
  });
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Photo *",
          style: AppFontStyle.styleBold18(context),
        ),
        SizedBox(
          height: 16 * getScaleFactor(context),
        ),
        SizedBox(
          width: width,
          height: height,
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              painter: DashedRectPainter(
                color: AppColors.darkGray,
                dashSpace: 7,
                dashWidth: 10,
                strokeWidth: 1,
                cornerRadius: 5,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Drag and drop or\nclick here to\nselect file',
                    style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
