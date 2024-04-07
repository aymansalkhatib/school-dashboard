import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sama/controller/finance_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class TrailingHeader extends StatelessWidget {
  const TrailingHeader({super.key, this.colorCircle});
  final Color? colorCircle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(
          colorCircle: colorCircle,
          icon: Assets.iconsTransaction,
          onTap: () {
            final controller = Get.find<FinanceControllerImp>();
            controller.resetController();
            controller.dialogTransaction();
          },
        ),
        SizedBox(width: 14 * getScaleFactor(context)),
        CustomIconButton(
          colorCircle: colorCircle,
          icon: Assets.iconsGear,
          onTap: () {},
        ),
        const Spacer(flex: 1),
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Omar Ayman",
                style: AppFontStyle.styleSemiBold14(context).copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "Admin",
                style: AppFontStyle.styleSemiBold14(context).copyWith(
                  color: AppColors.darkGray,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20 * getScaleFactor(context)),
        Container(
          width: 55 * getScaleFactor(context),
          height: 55 * getScaleFactor(context),
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(100),
          ),
          // child: SvgPicture.asset(
          //   Assets.iconsUser,
          //   colorFilter: const ColorFilter.mode(AppColors.backgroundWhite, BlendMode.srcIn),
          // ),

          child: Image.asset(
            Assets.imagesLogo,
            color: AppColors.primaryPurple,
          ),
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.colorCircle,
    required this.icon,
    this.onTap,
  });

  final Color? colorCircle;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60 * getScaleFactor(context),
        height: 60 * getScaleFactor(context),
        padding: EdgeInsets.all(13 * getScaleFactor(context)),
        decoration: BoxDecoration(
          color: colorCircle ?? AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: const ColorFilter.mode(AppColors.textBlack, BlendMode.srcIn),
        ),
      ),
    );
  }
}
