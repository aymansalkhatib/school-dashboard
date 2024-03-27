import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/enum/enum_pament.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/core/shared/create_column.dart';

import 'package:sama/view/new_student/widgets/radio_item.dart';

class ParentDatails extends GetView<AddNewStudentControllerImp> {
  const ParentDatails({super.key});

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
          const ContainerHeaderWithRadiusAndColorWithText(
              title: "Parent Details"),
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
                    title: controller.titleParentStudentColumn1,
                    hint: controller.hintParentStudentColumn1,
                    maxLinesForField: 4,
                    maxLinesIndexField: 2,
                    textController:
                        controller.textControllerParentStudentColumn1,
                    validators: controller.validationParentStudentColumn1,
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
                        title: controller.titleParentStudentColumn2,
                        hint: controller.hintParentStudentColumn2,
                        textController:
                            controller.textControllerParentStudentColumn2,
                        validators: controller.validationParentStudentColumn2,
                      ),
                      Text(
                        "Payment*",
                        style: AppFontStyle.styleBold18(context),
                      ),
                      const SizedBox(height: 8),
                      GetBuilder<AddNewStudentControllerImp>(
                          builder: (controllerImp) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RadioItem(
                              title: "Cache",
                              value: PaymentEnum.cache,
                              groupValue: controllerImp.statePayment,
                              onChanged: (PaymentEnum? value) {
                                controllerImp.selectChoicePayment(value!);
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RadioItem(
                              title: "Debit",
                              value: PaymentEnum.debit,
                              groupValue: controllerImp.statePayment,
                              onChanged: (PaymentEnum? value) {
                                controllerImp.selectChoicePayment(value!);
                              },
                            ),
                          ],
                        );
                      })
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
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
