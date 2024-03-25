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
    print(teachers);
    update();
  }

  @override
  void onInit() async {
    box = await MyAppServices().information;
    await fillListTeachers();
    super.onInit();
  }
}
