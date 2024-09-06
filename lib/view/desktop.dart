import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/view/drawer/drawer_view.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex
        : 345, child: CustomDrawer()),
        Expanded(
          flex: 1180 + 395,
          child: GetBuilder<NavigationControllerImp>(builder: (controller) {
            return controller.getCurrentPage();
          }),
        ),
      ],
    );
  }
}
