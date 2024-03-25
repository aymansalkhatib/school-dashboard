import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/model/class_model.dart';
import 'package:sama/model/section_model.dart';

abstract class ClassesController extends GetxController {}

class ClassesControllerImp extends ClassesController {
  late Box box;
  late int isActive;
  List<SectionModel> allSections = [];
  List<SectionModel> activeSections = [];
  changeIndex(int index) {
    isActive = index;
    getSections(isActive);
    update();
  }

  addSection() async {
    int length = activeSections.length;
    if (length >= 10) return;
    List<String> ordinalNames = [
      'The First',
      'The Second',
      'The Third',
      'The Fourth',
      'The Fifth',
      'The Sixth',
      'The Seventh',
      'The Eighth',
      'The Ninth',
      'The Tenth'
    ];
    SectionModel sectionModel = SectionModel(
      name: ordinalNames[length],
      level: classesModel[isActive].educationLevel,
      grade: classesModel[isActive].grade,
      numberStudent: 0,
    );
    await box.add(sectionModel);
    allSections.add(sectionModel);
    activeSections.add(sectionModel);
    update();
  }

  deleteSection() async {
    if (activeSections.isEmpty) return;
    List<SectionModel> sectionsToDelete = allSections
        .whereType<SectionModel>()
        .where((element) => element.grade == "Grade ${isActive + 1}")
        .toList();

    if (sectionsToDelete.isNotEmpty) {
      SectionModel sectionToDelete = sectionsToDelete.last;
      allSections.remove(sectionToDelete);
      activeSections.remove(sectionToDelete);
      final items = box.values.toList();
      int index = 0;

      for (var i = 0; i < items.length; i++) {
        if (items[i] is SectionModel && items[i].grade == sectionToDelete.grade) {
          index = i;
        }
      }
      await box.deleteAt(index);
      update();
    }
  }

  getSections(int index) {
    activeSections = allSections.where((element) {
      return element.grade == "Grade ${index + 1}";
    }).toList();
    update();
  }

  getAllSections() {
    allSections = box.values.whereType<SectionModel>().toList();
    update();
  }

  @override
  void onInit() async {
    isActive = 0;
    box = await MyAppServices().information;
    getAllSections();
    getSections(isActive);

    super.onInit();
  }
}
