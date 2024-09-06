import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/utils/pagination.dart';
import 'package:sama/view/trailing_dashboard/widgets/item_recent_students.dart';

class ListUserPagination extends StatelessWidget {
  const ListUserPagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Users",
            style: AppFontStyle.styleBold24(context),
          ),
          const SizedBox(height: 4),
          Text(
            "You have 741 user",
            style: AppFontStyle.styleRegular16(context).copyWith(color: AppColors.darkGray),
          ),
          const SizedBox(height: 8),
          ...List.generate(3, (index) => const ItemRecentStudents()),
          const SizedBox(height: 24),
          const MyPaginations()
        ],
      ),
    );
  }
}
