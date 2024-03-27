import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sama/controller/dashboard_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/helper/date.dart';

class TitleWithMonth extends StatelessWidget {
  const TitleWithMonth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "School Calendar",
          style: AppFontStyle.styleBold24(context)
              .copyWith(fontSize: 24 * getScaleFactor(context)),
        ),
        SizedBox(width: 20 * getScaleFactor(context)),
        Row(
          children: [
            GetBuilder<DashboardControllerImp>(
              builder: (controller) {
                return PopupMenuButton<String>(
                  color: AppColors.lightPurple,
                  elevation: 0,
                  tooltip: "Change Month",
                  onSelected: (value) {
                    controller.fillTableDate(
                        DateTime.now().year, getMonthNumber(value));
                  },
                  child: Text(
                    "${controller.dateTableModel.month} ${controller.dateTableModel.year}",
                    style: AppFontStyle.styleRegular18(context)
                        .copyWith(fontSize: 18 * getScaleFactor(context)),
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    for (int i = 1; i <= 12; i++)
                      PopupMenuItem<String>(
                        padding: const EdgeInsets.only(right: 20, left: 15),
                        height: 45 * getScaleFactor(context),
                        value: getMonthName(i),
                        child: Text(
                          getMonthName(i),
                          style: AppFontStyle.styleRegular18(context)
                              .copyWith(fontSize: 18 * getScaleFactor(context)),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(width: 3),
            Transform.rotate(
                angle: 22 / 7 * 2,
                child: SvgPicture.asset(
                  Assets.iconsDropdown,
                  width: 26 * getScaleFactor(context),
                  colorFilter: const ColorFilter.mode(
                      AppColors.darkGray, BlendMode.srcIn),
                ))
          ],
        ),
      ],
    );
  }
}
