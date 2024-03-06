import 'package:get/get.dart';

abstract class DrawerController extends GetxController {}

class DrawerControllerImp extends DrawerController {
  late int drawerItemIsActive;
  toggleItemDrawer(int index) {
    drawerItemIsActive = index;
    update();
  }

  @override
  void onInit() {
    drawerItemIsActive = 0;
    super.onInit();
  }
}
