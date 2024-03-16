import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class DetailsSections extends StatelessWidget {
  const DetailsSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3,
      child: Row(
        children: [
          Container(
            width: 24 * getScaleFactor(context),
            decoration: const BoxDecoration(
              color: AppColors.primaryPurple,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24 * getScaleFactor(context)),
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
                        "The First",
                        style: AppFontStyle.styleSemiBold18(context),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Level: Primary Education",
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
                        "Number of students: 30",
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
                        "Class: Oneth",
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
