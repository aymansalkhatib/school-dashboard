import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/utils/header_with_search.dart';
  import 'package:sama/view/new_teatcher/widgets/add_details_teacher.dart';
import 'package:sama/view/new_teatcher/widgets/education_datails.dart';
import 'package:sama/core/shared/save_and_submit_button.dart';

class AddNewTeacher extends StatelessWidget {
  const AddNewTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewStudentControllerImp());

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            HeaderWithSearch(title: "Add New Teacher", showSearch: false),
            SizedBox(height: 28),
            AddDetailsTeacher(),
            SizedBox(height: 40),
            EducationDatails(),
            SizedBox(height: 40),
            SaveAndSubmitButton(),
          ],
        ),
      ),
    );
  }
}
