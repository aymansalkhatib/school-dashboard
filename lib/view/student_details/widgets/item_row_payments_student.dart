import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/model/student_payment_model.dart';

import '../../../core/constants/app_colors.dart';

class ItemRowPaymentsStudent extends StatelessWidget {
  const ItemRowPaymentsStudent({
    super.key,
    required this.studentPaymentModel,
  });
  final StudentPaymentModel studentPaymentModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 56 / 2 * width / 1900,
                backgroundColor: AppColors.errorRed,
                child: Padding(
                  padding: EdgeInsets.all(12.0 * width / 1900),
                  child: SvgPicture.asset(
                    Assets.iconsTrending,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                studentPaymentModel.id,
                style: AppFontStyle.styleSemiBold18(context),
              ),
            ],
          ),
          Text(
            studentPaymentModel.date,
            style: AppFontStyle.styleRegular14(context)
                .copyWith(color: AppColors.darkGray),
          ),
          Text(
            studentPaymentModel.price,
            style: AppFontStyle.styleSemiBold18(context),
          ),
          Text(
            studentPaymentModel.status,
            textAlign: TextAlign.start,
            style: AppFontStyle.styleSemiBold18(context).copyWith(
              color: studentPaymentModel.status == "Complete"
                  ? AppColors.secondaryGreen
                  : studentPaymentModel.status == "Canceled"
                      ? AppColors.errorRed
                      : AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
