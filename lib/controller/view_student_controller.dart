import 'package:get/get.dart';
import 'package:hive/hive.dart';
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

  @override
  void onInit() async {
    box = await MyAppServices().information;
    await fillListStudent();
    super.onInit();
  }
}
