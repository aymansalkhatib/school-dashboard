import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/model/student_payment_model.dart';
import 'package:sama/utils/pagination.dart';
import 'package:sama/view/users/widgets/user_card_info.dart';

class Students extends StatelessWidget {
  const Students({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCardInfo(
            aspectRatioP1000: 415,
            name: "Karen Hope",
            mask: Assets.imagesMaskingStudent,
            informations: itemCardUserModel,
          ),
          const SizedBox(height: 40),
          const StudentPayments(),
        ],
      ),
    );
  }
}

class StudentPayments extends StatelessWidget {
  const StudentPayments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment History",
            style: AppFontStyle.styleBold24(context),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              ...List.generate(
                  studentsPaymentModel.length,
                  (index) => ItemRowPaymentsStudent(
                        studentPaymentModel: studentsPaymentModel[index],
                      )),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Showing ',
                            style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray)),
                        TextSpan(text: '1-5 ', style: AppFontStyle.styleRegular14(context)),
                        TextSpan(
                            text: 'from ',
                            style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray)),
                        TextSpan(text: '100 ', style: AppFontStyle.styleRegular14(context)),
                        TextSpan(
                            text: 'data',
                            style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray)),
                      ],
                    ),
                  ),
                  const MyPaginations(length: 3)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

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
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
            style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray),
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
