import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/core/shared/create_column.dart';
import 'package:sama/view/new_student/widgets/image_with_title_inside_details_student.dart';
import 'package:sama/view/new_student/widgets/pop_menu_items_section_or_class.dart';

class AddDetailsStudnet extends GetView<AddNewStudentControllerImp> {
  const AddDetailsStudnet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContainerHeaderWithRadiusAndColorWithText(
              title: "Student Details"),
          SizedBox(height: 30 * getScaleFactor(context)),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 40 * getScaleFactor(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 16,
                  child: ImageWithTitleInsideDetailsStudent(),
                ),
                SizedBox(width: 40 * getScaleFactor(context)),
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                    title: controller.titleStudentColumn1,
                    hint: controller.hintStudentColumn1,
                    maxLinesForField: 5,
                    maxLinesIndexField: 3,
                    textController: controller.textControllerStudentColumn1,
                    validators: controller.validationStudentColumn1,
                  ),
                ),
                SizedBox(
                  width: 24 * getScaleFactor(context),
                ),
                Expanded(
                  flex: 42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CreateColumn(
                        title: controller.titleStudentColumn2,
                        hint: controller.hintStudentColumn2,
                        textController: controller.textControllerStudentColumn2,
                        validators: controller.validationStudentColumn2,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Text("Grade *",
                                  style: AppFontStyle.styleBold18(context))),
                          const SizedBox(width: 16),
                          Expanded(
                              flex: 4,
                              child: Text("Section *",
                                  style: AppFontStyle.styleBold18(context))),
                        ],
                      ),
                      SizedBox(
                        height: 16 * getScaleFactor(context),
                      ),
                      const Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child:
                                  PopMenuItemsSectionOrClass(menuClass: true)),
                          SizedBox(width: 16),
                          Expanded(
                              flex: 4,
                              child:
                                  PopMenuItemsSectionOrClass(menuClass: false)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
