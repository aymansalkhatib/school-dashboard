import 'package:flutter/material.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/utils/pagination.dart';
import 'package:sama/view/dashboard/widgets/row_unpaid_student.dart';

class UnpaidStudent extends StatelessWidget {
  const UnpaidStudent({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32 * getScaleFactor(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Unpaid Student Intuition",
              style: AppFontStyle.styleBold24(context),
            ),
          ),
          const SizedBox(height: 24),
          ...List.generate(
            5,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: RowUnpaidStudent(
                name: "Ayman Al-Khatib",
                id: "123456789",
                className: "VII A",
                price: 50.036,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const MyPaginations(length: 3),
        ],
      ),
    );
  }
}
