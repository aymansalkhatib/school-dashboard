import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/create_column.dart';
import 'package:sama/core/shared/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/view/new_teatcher/widgets/image_with_title_inside_details_student.dart';

class AddDetailsTeacher extends StatelessWidget {
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
                    title: titleC1,
                    hint: hintC1,
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
                      CreateColumn(title: titleC2, hint: hintC2),
                      const ImageWithTitleInsideDetailsStudent(
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

List<String> titleC1 = ["First Name *", "Email *", "Address *", "Date of Birth *"];
List<List<String>> hintC1 = [
  ["First Name"],
  ["Email"],
  [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  ],
  ["24 Februari 1997"]
];

List<String> titleC2 = ["Last Name *", "Phone *"];
List<List<String>> hintC2 = [
  ["Last Name"],
  ["+1234567890"],
];
