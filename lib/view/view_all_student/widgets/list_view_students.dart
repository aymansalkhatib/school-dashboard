import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sama/controller/view_student_controller.dart';
import 'package:sama/view/view_all_student/widgets/header_table_students.dart';
import 'package:sama/view/view_all_student/widgets/item_table_students.dart';

class ListViewStudents extends StatelessWidget {
  const ListViewStudents({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: GetBuilder<ViewStudentControllerImp>(builder: (controller) {
          return controller.students.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        itemCount: controller.students.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              if (index == 0) const HeaderTableStudents(),
                              const Divider(height: 32),
                              ItemTableStudents(
                                  studentModel: controller.students[index],
                                  index: index),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        }),
      ),
    );
  }
}
