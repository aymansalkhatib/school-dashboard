import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sama/core/constants/classes.dart';
import 'package:sama/core/my_services.dart';
import 'package:sama/model/class_model.dart';
import 'package:sama/model/section_model.dart';
import 'package:sama/model/student_model.dart';

abstract class ClassesController extends GetxController {}

class ClassesControllerImp extends ClassesController {
  int paginationIndex = 0;
  int spilt = 4;
  List<SectionModel> paginationViewSection = [];

  late Box box;
  late int isActive;
  List<SectionModel> allSections = [];
  List<SectionModel> activeSections = [];
  changeIndex(int index) {
    isActive = index;
    paginationIndex = 0;
    getSections(isActive);
    update();
  }

  changeIndexPagination(int newPaginationIndex) {
    int skip = newPaginationIndex * spilt;
    if (newPaginationIndex < 0 || skip >= activeSections.length) {
      paginationViewSection = [];
      update();
      return;
    }
    paginationIndex = newPaginationIndex;
    paginationViewSection = activeSections.sublist(skip, min(activeSections.length, skip + spilt));
    update();
  }

  addSection() async {
    int length = activeSections.length;
    if (length >= 10) return;

    SectionModel sectionModel = SectionModel(
      name: ordinalNames[length],
      level: classesModel[isActive].educationLevel,
      grade: classesModel[isActive].grade,
      numberStudent: 0,
    );
    await box.add(sectionModel);
    allSections.add(sectionModel);
    activeSections.add(sectionModel);
    changeIndexPagination(paginationIndex);

    update();
  }

  deleteSection() async {
    bool? confirmDelete = await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this section and all associated students?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );

    if (activeSections.isEmpty || confirmDelete == null || !confirmDelete) return;

    List<SectionModel> sectionsToDelete = allSections
        .whereType<SectionModel>()
        .where((element) => element.grade == "Grade ${isActive + 1}")
        .toList();

    if (sectionsToDelete.isNotEmpty) {
      SectionModel sectionToDelete = sectionsToDelete.last;

      final items = box.values.toList();
      int index = 0;

      List<int> listRemoveIndexSections = [];

      for (var i = 0; i < items.length; i++) {
        if (items[i] is SectionModel && items[i].grade == sectionToDelete.grade) {
          index = i;
        }
      }

      for (var i = 0; i < items.length; i++) {
        if (items[i] is StudentModel) {
          StudentModel student = items[i] as StudentModel;
          if (student.grade == levels[isActive]) {
            if (student.section == (items[index] as SectionModel).name) {
              listRemoveIndexSections.add(i);
            }
          }
        }
      }
      listRemoveIndexSections.sort((a, b) => b.compareTo(a));
      for (var i = 0; i < listRemoveIndexSections.length; i++) {
        box.deleteAt(listRemoveIndexSections[i]);
      }
      box.deleteAt(index);
      allSections.remove(sectionToDelete);
      activeSections.remove(sectionToDelete);
      changeIndexPagination(paginationIndex);

      update();
    }
  }

  getSections(int index) {
    activeSections = allSections.where((element) {
      return element.grade == "Grade ${index + 1}";
    }).toList();
    changeIndexPagination(paginationIndex);
    update();
  }

  getAllSections() {
    allSections = box.values.whereType<SectionModel>().toList();
    update();
  }

  @override
  void onInit() async {
    isActive = 0;
    box = MyAppServices().box;
    getAllSections();
    getSections(isActive);

    super.onInit();
  }
}
