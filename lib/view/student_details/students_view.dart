import 'package:flutter/material.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/view/student_details/widgets/student_payments.dart';
import 'package:sama/view/users_details/widgets/user_card_info.dart';

class Students extends StatelessWidget {
  const Students({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCardInfo(
            name: "Maria Historia",
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
