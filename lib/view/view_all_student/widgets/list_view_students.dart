import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sama/controller/view_student_controller.dart';
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
      child: GetBuilder<ViewStudentControllerImp>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const HeaderTableStudents(),
              ...List.generate(
                controller.students.length,
                (index) => Column(
                  children: [
                    const Divider(height: 32),
                    ItemTableStudents(
                      studentModel: controller.students[index],
                      index:index
                    ),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 40, right: 40, top: 40),
              //   child: MyPaginations(),
              // )
            ],
          ),
        );
      }),
    );
  }
}
