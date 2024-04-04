import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/model/teacher_model.dart';

abstract class ViewTeacherController extends GetxController {}

class ViewTeacherControllerImp extends ViewTeacherController {
  late Box box;
  List<TeacherModel> teachers = [];

  fillListTeachers() {
    teachers = box.values.whereType<TeacherModel>().toList();
    update();
  }

  removeTeacher(int index) async {
    List items = box.values.toList();
    for (int i = 0; i < items.length; i++) {
      if (items[i] is TeacherModel && items[i].id == teachers[index].id) {
        if (items[i].image != null) {
          File imageFile = File(items[i].image);
          if (imageFile.existsSync()) imageFile.deleteSync();
        }
        await box.deleteAt(i);
        teachers.removeAt(index);
        update();
        return;
      }
    }
  }

  @override
  void onInit() async {
    box = MyAppServices().box;
    await fillListTeachers();
    super.onInit();
  }
}
