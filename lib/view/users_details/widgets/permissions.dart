import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/view/users_details/widgets/permissions_item.dart';
import 'package:sama/view/users_details/widgets/row_active_not_active.dart';

class Permissions extends StatelessWidget {
  const Permissions({
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
            "Permissions",
            style: AppFontStyle.styleBold24(context),
          ),

          //! Handle after connect DB
          const SizedBox(height: 18),
          const PermissionsItem(
              icon: Assets.iconsStudent2,
              title: 'Controlling students',
              isActive: true),
          const SizedBox(height: 18),
          const PermissionsItem(
              icon: Assets.iconsSell,
              title: 'Payment and receipt',
              isActive: false),
          const SizedBox(height: 18),
          const PermissionsItem(
              icon: Assets.iconsMarks,
              title: 'Add and update marks',
              isActive: true),
          //!,

          const SizedBox(height: 30),
          const RowActiveAndNotActive()
        ],
      ),
    );
  }
}
