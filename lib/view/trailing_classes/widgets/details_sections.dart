import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/section_model.dart';

class DetailsSections extends StatelessWidget {
  const DetailsSections({
    super.key,
    required this.sectionModel,
    required this.index,
  });
  final int index;
  final SectionModel sectionModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Row(
        children: [
          Container(
            width: 26 * getScaleFactor(context),
            decoration: BoxDecoration(
              color: [
                AppColors.primaryPurple,
                AppColors.accentOrange,
                AppColors.highlightYellow,
                AppColors.textBlack,
              ][index % 4],
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20 * getScaleFactor(context)),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        sectionModel.name,
                        style: AppFontStyle.styleSemiBold18(context),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        sectionModel.level,
                        style: AppFontStyle.styleRegular15(context).copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Number Students ${sectionModel.numberStudent}",
                        style: AppFontStyle.styleRegular14(context).copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        sectionModel.grade,
                        style: AppFontStyle.styleRegular14(context).copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
