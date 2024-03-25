import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_teacher_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/create_column.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/view/new_teatcher/widgets/image_with_title_inside_details_teacher.dart';

class AddDetailsTeacher extends GetView<AddNewTeacherControllerImp> {
  const AddDetailsTeacher({super.key});

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
          const ContainerHeaderWithRadiusAndColorWithText(title: "Personal Details"),
          SizedBox(height: 30 * getScaleFactor(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40 * getScaleFactor(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                    title: controller.titleTeacherColumn1,
                    hint: controller.hintTeacherColumn1,
                    textController: controller.textControllerTeacherColumn1,
                    maxLinesForField: 5,
                    maxLinesIndexField: 2,
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
                        title: controller.titleTeacherColumn2,
                        hint: controller.hintTeacherColumn2,
                        textController: controller.textControllerTeacherColumn2,
                      ),
                      const ImageWithTitleInsideDetailsTeacher(
                        height: 127,
                      ),
                      SizedBox(height: 32 * getScaleFactor(context)),
                      const CreateColumn(title: [
                        "Place of Birth *"
                      ], hint: [
                        ["Jakarta, Indonesia"]
                      ]),
                    ],
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
