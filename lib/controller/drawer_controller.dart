import 'package:get/get.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/core/enum/navigations_enum.dart';

abstract class DrawerController extends GetxController {}

class DrawerControllerImp extends DrawerController {
  late int drawerItemIsActive;
  final navigation = Get.find<NavigationControllerImp>();
  toggleItemDrawer(int index, NavigationEnum destenation) {
    if (drawerItemIsActive == index) return;
    navigation.replaceLastWidget(destenation);
    drawerItemIsActive = index;
    update();
  }

  @override
  void onInit() {
    drawerItemIsActive = 0;
    super.onInit();
  }
}
