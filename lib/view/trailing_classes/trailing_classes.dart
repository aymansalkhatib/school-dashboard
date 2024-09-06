import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sama/controller/classes_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/utils/pagination.dart';
import 'package:sama/view/trailing_classes/widgets/details_sections.dart';

class TrailingClasses extends StatelessWidget {
  const TrailingClasses({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassesControllerImp>(builder: (controller) {
      return Container(
        margin: EdgeInsets.only(left: 40 * getScaleFactor(context)),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sections", style: AppFontStyle.styleBold32(context)),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.deleteSection();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12 * getScaleFactor(context)),
                        decoration: BoxDecoration(
                          color: controller.activeSections.isNotEmpty
                              ? AppColors.primaryPurple
                              : AppColors.errorRed,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          width: 16,
                          height: 16,
                          Assets.iconsMinus,
                          colorFilter: const ColorFilter.mode(AppColors.backgroundWhite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        controller.addSection();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12 * getScaleFactor(context)),
                        decoration: BoxDecoration(
                          color: controller.activeSections.length < 10
                              ? AppColors.primaryPurple
                              : AppColors.darkGray,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          Assets.iconsAdd,
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(AppColors.backgroundWhite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List.generate(
              controller.paginationViewSection.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DetailsSections(sectionModel: controller.paginationViewSection[index], index: index),
              ),
            ),
            if (controller.activeSections.length > 4)
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: MyPaginations(
                  index: controller.paginationIndex,
                  maxIndex: (controller.activeSections.length / controller.spilt).ceil() - 1,
                  showLength: false,
                  next: () => controller.changeIndexPagination(controller.paginationIndex - 1),
                  previous: () => controller.changeIndexPagination(controller.paginationIndex + 1),
                ),
              )
          ],
        ),
      );
    });
  }
}
