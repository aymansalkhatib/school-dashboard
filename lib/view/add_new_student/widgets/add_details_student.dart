import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/view/add_new_student/widgets/container_header_with_radius_and_color_with_text.dart';
import 'package:sama/view/add_new_student/widgets/create_column.dart';
import 'package:sama/view/add_new_student/widgets/image_with_title_inside_details_student.dart';

class AddDetailsStudnet extends StatelessWidget {
  const AddDetailsStudnet({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1500 / 790,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeaderWithRadiusAndColorWithText(title: "Student Details"),
            SizedBox(height: 30 * getScaleFactor(context)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40 * getScaleFactor(context)),
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
                      title: titleC1,
                      hint: hintC1,
                      maxLinesForLastField: 4,
                    ),
                  ),
                  SizedBox(
                    width: 24 * getScaleFactor(context),
                  ),
                  Expanded(
                    flex: 42,
                    child: CreateColumn(title: titleC2, hint: hintC2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> titleC1 = ["First Name *", "Date & Place of Brith*", "Email *", "Address *"];
List<List<String>> hintC1 = [
  ["First Name"],
  ["24 Februari 2005", "Damascus"],
  ["Email"],
  [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  ]
];

List<String> titleC2 = ["Last Name *", "Parent Name *", "Phone"];
List<List<String>> hintC2 = [
  ["Last Name"],
  ["Parent Name"],
  ["Phone"],
];
