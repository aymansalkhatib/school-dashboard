import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/utils/row_info.dart';
import 'package:sama/view/teacher/widgets/education_item.dart';

class TeachersInfo extends StatelessWidget {
  const TeachersInfo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 65, right: 32, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //////////////////////////////!
          Text(
            "Maria Historia",
            style: AppFontStyle.styleBold32(context, lower: 0.7),
          ),
          Text(
            "History Teacher",
            style: AppFontStyle.styleSemiBold18(context, lower: 0.7).copyWith(
              color: AppColors.darkGray,
            ),
          ),
          //////////////////////////////!
          const SizedBox(height: 25),
          RowInfo(inforamtions: itemCardUserModel),
          //////////////////////////////!
          const SizedBox(height: 30),

          Text(
            "About:",
            style: AppFontStyle.styleBold24(context),
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                  style: AppFontStyle.styleRegular18(context).copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
          const SizedBox(height: 30),

          Text(
            "Education:",
            style: AppFontStyle.styleBold24(context),
          ),
          const SizedBox(height: 12),
          const EducationItem(
            title: "History Major, University Akademi Historia",
            body: "2013-2017",
          ),
          const SizedBox(height: 18),
          const EducationItem(
            title: "History Major, University Akademi Historia",
            body: "2013-2017",
          ),
          const SizedBox(height: 30),

          Text(
            "Expertise:",
            style: AppFontStyle.styleBold24(context),
          ),
          const SizedBox(height: 6),

          Text(
            "World History, Philosophy, Prehistoric, Culture, Ancients",
            style: AppFontStyle.styleRegular18(context).copyWith(
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
