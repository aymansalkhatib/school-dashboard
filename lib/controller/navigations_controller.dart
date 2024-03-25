import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/view/classes/classes_with_trailing.dart';
import 'package:sama/view/dashboard/dashboard_with_trailing.dart';
import 'package:sama/view/new_student/add_new_student.dart';
import 'package:sama/view/new_teatcher/add_new_teacher.dart';
import 'package:sama/view/users_details/users_with_trailing.dart';
import 'package:sama/view/view_all_student/view_all_student.dart';
import 'package:sama/view/view_all_teacher/view_all_teacher.dart';

abstract class NavigationController extends GetxController {
  Widget getCurrentPage();
}

class NavigationControllerImp extends NavigationController {
  late Widget _currentPage;

  void replaceLastWidget(NavigationEnum destination, {Map<String, dynamic>? info}) {
    switch (destination) {
      case NavigationEnum.Dashboard:
        _currentPage = const DashboardWithTrailing();
      case NavigationEnum.Classes:
        _currentPage = ClassesWithTrailing(info: info);

      case NavigationEnum.Teachers:
        _currentPage = const ViewAllTeacher();
      case NavigationEnum.Students:
        _currentPage = const ViewAllStudent();
      case NavigationEnum.Users:
        _currentPage = const UsersWithTrailing();
      case NavigationEnum.AddNewStudent:
        _currentPage = const AddNewStudent();
      case NavigationEnum.AddNewTeacher:
        _currentPage = const AddNewTeacher();
    }

    update();
  }

  @override
  Widget getCurrentPage() {
    return _currentPage;
  }

  @override
  void onInit() {
    _currentPage = const DashboardWithTrailing();
    super.onInit();
  }
}
