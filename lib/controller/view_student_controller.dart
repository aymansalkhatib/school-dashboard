import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sama/controller/finance_controller.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/model/student_model.dart';

abstract class ViewStudentController extends GetxController {}

class ViewStudentControllerImp extends ViewStudentController {
  late Box box;
  List<StudentModel> students = [];

  fillListStudent() {
    students = box.values.whereType<StudentModel>().toList();
    update();
  }

  removeStudent(int index) async {
    List items = box.values.toList();
    for (int i = 0; i < items.length; i++) {
      if (items[i] is StudentModel && items[i].id == students[index].id) {
        if (items[i].image != null) {
          File imageFile = File(items[i].image);
          if (imageFile.existsSync()) imageFile.deleteSync();
        }
        await box.deleteAt(i);
        students.removeAt(index);
        Get.find<FinanceControllerImp>().resetController();
        update();
        return;
      }
    }
  }

  @override
  void onInit() async {
    box = MyAppServices().box;
    await fillListStudent();
    super.onInit();
  }
}
