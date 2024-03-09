import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';
import 'package:sama/model/schedule_details_model.dart';

class TrailingTeacher extends StatelessWidget {
  const TrailingTeacher({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderTrailingTeacher(),
        SizedBox(height: 30),
        ListItemScheduleDetails(),
      ],
    );
  }
}

class ListItemScheduleDetails extends StatelessWidget {
  const ListItemScheduleDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          scheduleDetailsModel.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: ItemScheduleDetails(
              scheduleDetailsModel: scheduleDetailsModel[index],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemScheduleDetails extends StatelessWidget {
  const ItemScheduleDetails({
    super.key,
    required this.scheduleDetailsModel,
  });

  final ScheduleDetailsModel scheduleDetailsModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 386 / 183,
      child: Row(
        children: [
          Container(
            width: 24,
            decoration: BoxDecoration(
              color: scheduleDetailsModel.prefixColor,
              borderRadius: const BorderRadius.horizontal(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      scheduleDetailsModel.title,
                      style: AppFontStyle.styleSemiBold18(context),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      scheduleDetailsModel.subtitle,
                      style: AppFontStyle.styleRegular14(context).copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconWithTextInsideItemScheduleDetails(
                    icon: Assets.iconsCalendar,
                    iconColor: AppColors.accentOrange,
                    text: scheduleDetailsModel.date,
                  ),
                  const SizedBox(height: 4),
                  IconWithTextInsideItemScheduleDetails(
                    icon: Assets.iconsClock,
                    iconColor: AppColors.highlightYellow,
                    text: scheduleDetailsModel.time,
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

class IconWithTextInsideItemScheduleDetails extends StatelessWidget {
  const IconWithTextInsideItemScheduleDetails({
    super.key,
    required this.iconColor,
    required this.icon,
    required this.text,
  });
  final Color iconColor;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 28 * getScaleFactor(context),
          height: 28 * getScaleFactor(context),
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppFontStyle.styleRegular14(context).copyWith(
            color: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}

class HeaderTrailingTeacher extends StatelessWidget {
  const HeaderTrailingTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 386 / 129,
      child: Container(
        padding: EdgeInsets.all(24 * getScaleFactor(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Schedule Details",
                style: AppFontStyle.styleBold24(context).copyWith(
                  fontSize: 24 * getScaleFactor(context),
                ),
              ),
            ),
            const Spacer(flex: 3),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Thursday, 10th April , 2021",
                style: AppFontStyle.styleMedium14(context).copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
