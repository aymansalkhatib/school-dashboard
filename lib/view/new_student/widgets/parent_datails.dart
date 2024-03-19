import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/enum/enum_pament.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/core/shared/create_column.dart';

 import 'package:sama/view/new_student/widgets/radio_item.dart';

class ParentDatails extends StatelessWidget {
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
          const ContainerHeaderWithRadiusAndColorWithText(title: "Parent Details"),
          SizedBox(height: 30 * getScaleFactor(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40 * getScaleFactor(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 42,
                  child: CreateColumn(
                    title: titleC1,
                    hint: hintC1,
                    maxLinesForField: 4,
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
                      CreateColumn(title: titleC2, hint: hintC2),
                      Text(
                        "Payment*",
                        style: AppFontStyle.styleBold18(context),
                      ),
                      const SizedBox(height: 8),
                      GetBuilder<AddNewStudentControllerImp>(builder: (controllerImp) {
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

List<String> titleC1 = ["First Name *", "Email *", "Address *"];
List<List<String>> hintC1 = [
  ["First Name"],
  ["Email"],
  [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  ]
];

List<String> titleC2 = ["Last Name *", "Phone"];
List<List<String>> hintC2 = [
  ["Last Name"],
  ["Phone"],
];
