import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/classes_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/classes/classes.dart';
import 'package:sama/view/trailing_classes/trailing_classes.dart';

class ClassesWithTrailing extends StatelessWidget {
  const ClassesWithTrailing({super.key, this.info});
  final Map<String, dynamic>? info;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassesControllerImp());
    controller.isActive = info?["isActive"] ?? controller.isActive;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40 * getScaleFactor(context)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderWithSearch(title: "Classes"),
            SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1180, child: Classes()),
                Expanded(flex: 395, child: TrailingClasses()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
