import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/shared/save_and_submit_button.dart';

import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/new_student/widgets/add_details_student.dart';
import 'package:sama/view/new_student/widgets/parent_datails.dart';

class AddNewStudent extends StatelessWidget {
  const AddNewStudent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyReplace(() => AddNewStudentControllerImp());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: Get.find<AddNewStudentControllerImp>().globalKey,
          child: Column(
            children: [
              const HeaderWithSearch(title: "Add New Student", showSearch: false),
              const SizedBox(height: 28),
              const AddDetailsStudnet(),
              const SizedBox(height: 40),
              const ParentDatails(),
              const SizedBox(height: 40),
              SaveAndSubmitButton(
                onPressedSubbmit: () async {
                  await Get.find<AddNewStudentControllerImp>().addNewStudent();
                },
                onPressedCancel: () {
                  Get.find<AddNewStudentControllerImp>().pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
