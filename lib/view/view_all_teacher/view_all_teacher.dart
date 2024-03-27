import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/controller/view_teacher_controller.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/core/shared/search_with_new_user.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/view_all_teacher/widgets/item_grid_vew_teachers.dart';

class ViewAllTeacher extends StatelessWidget {
  const ViewAllTeacher({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ViewTeacherControllerImp());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const HeaderWithSearch(title: "Teachers", showSearch: false),
            const SizedBox(height: 40),
            SearchWithNewUser(
              text: "New Teacher",
              onPressed: () {
                Get.find<NavigationControllerImp>()
                    .replaceLastWidget(NavigationEnum.AddNewTeacher);
              },
            ),
            const SizedBox(height: 40),
            GetBuilder<ViewTeacherControllerImp>(builder: (controller) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 40,
                  childAspectRatio: 340 / 360,
                ),
                itemCount: controller.teachers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemGridVewTeachers(
                      teacherModel: controller.teachers[index], index: index);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
