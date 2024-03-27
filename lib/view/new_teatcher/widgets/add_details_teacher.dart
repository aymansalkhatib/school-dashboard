import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_teacher_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/create_column.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/core/utils/validation.dart';
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
          const ContainerHeaderWithRadiusAndColorWithText(
              title: "Personal Details"),
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
                    title: controller.titleTeacherColumn1,
                    hint: controller.hintTeacherColumn1,
                    textController: controller.textControllerTeacherColumn1,
                    validators: controller.validationTeacherColumn1,
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
                        validators: controller.validationTeacherColumn2,
                      ),
                      const ImageWithTitleInsideDetailsTeacher(
                        height: 127,
                      ),
                      const SizedBox(height: 21),
                      const CreateColumn(validators: [
                        [Validation.length]
                      ], title: [
                        "Place of Birth *"
                      ], hint: [
                        ["Jakarta, Indonesia"],
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
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 40 * getScaleFactor(context)),
            child: Row(
              children: [
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                      textController: [
                        [controller.about]
                      ],
                      maxLinesForField: 4,
                      maxLinesIndexField: 0,
                      validators: const [
                        [Validation.length]
                      ],
                      title: const ["About"],
                      hint: const [
                        ["Talk about yourself"],
                      ]),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                      textController: [
                        [controller.expiration]
                      ],
                      maxLinesForField: 4,
                      maxLinesIndexField: 0,
                      validators: const [
                        [Validation.length]
                      ],
                      title: const ["Expiration"],
                      hint: const [
                        ["Jakarta, Indonesia"],
                      ]),
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
//  const Expanded(
//                   flex: 16,
//                   child: SizedBox(),
//                 ),
//                 SizedBox(width: 40 * getScaleFactor(context)),
