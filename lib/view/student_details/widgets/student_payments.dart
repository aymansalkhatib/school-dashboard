import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/utils/pagination.dart';
import 'package:sama/model/student_payment_model.dart';
import 'package:sama/view/student_details/widgets/item_row_payments_student.dart';

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
              const MyPaginations()
            ],
          )
        ],
      ),
    );
  }
}
