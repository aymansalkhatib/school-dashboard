import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_teacher_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/core/shared/create_column.dart';

class EducationDatails extends GetView<AddNewTeacherControllerImp> {
  const EducationDatails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContainerHeaderWithRadiusAndColorWithText(title: "Education"),
          SizedBox(height: 30 * getScaleFactor(context)),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 40 * getScaleFactor(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                    title: controller.titleEducationTeacherColumn1,
                    hint: controller.hintEducationTeacherColumn1,
                    textController:
                        controller.textControllerEducationTeacherColumn1,
                    maxLinesForField: 4,
                    validators: controller.validationEducationTeacherColumn1,
                    maxLinesIndexField: 2,
                  ),
                ),
                SizedBox(
                  width: 24 * getScaleFactor(context),
                ),
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                    title: controller.titleEducationTeacherColumn2,
                    hint: controller.hintEducationTeacherColumn2,
                    textController:
                        controller.textControllerEducationTeacherColumn2,
                    validators: controller.validationEducationTeacherColumn2,
                  ),
                ),
                const Expanded(
                  flex: 16,
                  child: SizedBox(),
                ),
                SizedBox(width: 40 * getScaleFactor(context)),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

List<String> titleC1 = ["University *", "Start & End Date *"];
List<List<String>> hintC1 = [
  ["University Akademi Historia"],
  ["September 2013", "September 2017"],
];

List<String> titleC2 = ["Degree *", "City *"];
List<List<String>> hintC2 = [
  ["History Major"],
  ["Yogyakarta, Indonesia"],
];
