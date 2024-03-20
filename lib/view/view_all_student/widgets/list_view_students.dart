import 'package:flutter/material.dart';
import 'package:sama/core/utils/pagination.dart';
import 'package:sama/view/view_all_student/widgets/header_table_students.dart';
import 'package:sama/view/view_all_student/widgets/item_table_students.dart';

class ListViewStudents extends StatelessWidget {
  const ListViewStudents({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const HeaderTableStudents(),
          ...List.generate(
            12,
            (index) => const Column(
              children: [
                Divider(height: 32),
                ItemTableStudents(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 40),
            child: MyPaginations(),
          )
        ],
      ),
    );
  }
}
