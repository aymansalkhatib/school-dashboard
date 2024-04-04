import 'package:flutter/material.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/model/student_model.dart';
import 'package:sama/view/student_details/widgets/student_payments.dart';
import 'package:sama/core/shared/user_card_info.dart';

class Students extends StatelessWidget {
  const Students({super.key, required this.studentModel});
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCardInfo(
            imageDefault: Assets.imagesStudentDefault,
            name: "${studentModel.firstName} ${studentModel.lastName}",
            mask: Assets.imagesMaskingStudent,
            informations: retListItemCardUserModel(
              email: studentModel.email,
              location: studentModel.address,
              phone: studentModel.phone,
            ),
            image: studentModel.image,
          ),
          const SizedBox(height: 40),
          const StudentPayments(),
        ],
      ),
    );
  }
}
