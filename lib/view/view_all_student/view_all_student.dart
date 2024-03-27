import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/view_student_controller.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/core/shared/search_with_new_user.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/view_all_student/widgets/list_view_students.dart';

import '../../controller/navigations_controller.dart';

class ViewAllStudent extends StatelessWidget {
  const ViewAllStudent({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ViewStudentControllerImp());
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const HeaderWithSearch(title: "Students", showSearch: false),
          const SizedBox(height: 40),
          SearchWithNewUser(
            text: "New Student",
            onPressed: () {
              Get.find<NavigationControllerImp>()
                  .replaceLastWidget(NavigationEnum.AddNewStudent);
            },
          ),
          const SizedBox(height: 40),
          const Expanded(child: ListViewStudents())
        ],
      ),
    );
  }
}
