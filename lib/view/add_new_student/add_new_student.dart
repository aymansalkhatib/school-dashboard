import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_student_controller.dart';

import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/add_new_student/widgets/add_details_student.dart';
import 'package:sama/view/add_new_student/widgets/parent_datails.dart';
import 'package:sama/view/add_new_student/widgets/save_and_submit_button.dart';

class AddNewStudent extends StatelessWidget {
  const AddNewStudent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewStudentControllerImp());
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            HeaderWithSearch(title: "Add New Student", showSearch: false),
            SizedBox(height: 28),
            AddDetailsStudnet(),
            SizedBox(height: 40),
            ParentDatails(),
            SizedBox(height: 40),
            SaveAndSubmitButton(),
          ],
        ),
      ),
    );
  }
}
