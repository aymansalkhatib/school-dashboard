import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/drawer_controller.dart';
import 'package:sama/model/drawer_item_model.dart';
import 'package:sama/view/drawer/widgets/drawer_item.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
            drawerItem.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: GetBuilder<DrawerControllerImp>(builder: (controller) {
                    return GestureDetector(
                      onTap: () => controller.toggleItemDrawer(index, drawerItem[index].destination),
                      child: DrawerItem(
                        drawerItemModel: drawerItem[index],
                        isActive: controller.drawerItemIsActive == index,
                      ),
                    );
                  }),
                ))
      ],
    );
  }
}
