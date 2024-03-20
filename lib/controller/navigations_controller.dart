import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/view/new_student/add_new_student.dart';
import 'package:sama/view/classes/classes_with_trailing.dart';
import 'package:sama/view/dashboard/dashboard_with_trailing.dart';
import 'package:sama/view/new_teatcher/add_new_teacher.dart';
import 'package:sama/view/student_details/student_with_triling.dart';
import 'package:sama/view/teacher_details/teacher_with_trailing.dart';
import 'package:sama/view/users_details/users_with_trailing.dart';
import 'package:sama/view/view_all_student/view_all_student.dart';

abstract class NavigationController extends GetxController {
  void navigateTo(NavigationEnum destination);
  void pop();
  Widget getCurrentPage();
}

class NavigationControllerImp extends NavigationController {
  late List<Widget> _navigationStack;
  late Widget _currentPage;

  @override
  void navigateTo(NavigationEnum destination) {
    if (destination == _getNavigationFromWidget(_currentPage)) {
      return;
    }

    Widget page = _getPage(destination) ?? _createPage(destination);

    _navigationStack.add(page);
    _currentPage = page;
    update();
  }

  @override
  void pop() {
    if (_navigationStack.length > 2) {
      _navigationStack.removeLast();
      _currentPage = _navigationStack.last;
      update();
    } else {
      debugPrint("one screen in stack");
    }
  }

  void replaceLastWidget(NavigationEnum destination) {
    if (_navigationStack.isNotEmpty) {
      _currentPage = _getPage(destination) ?? _createPage(destination);
      _navigationStack.removeLast();
      _navigationStack.add(_currentPage);
      update();
    }
  }

  @override
  Widget getCurrentPage() {
    return _currentPage;
  }

  Widget? _getPage(NavigationEnum destination) {
    for (var page in _navigationStack.reversed) {
      if (_getNavigationFromWidget(page) == destination) {
        return page;
      }
    }
    return null;
  }

// TODO:  [add NavigationEnum new screen]

  NavigationEnum? _getNavigationFromWidget(Widget widget) {
    if (widget is DashboardWithTrailing) {
      return NavigationEnum.Dashboard;
    } else if (widget is ClassesWithTrailing) {
      return NavigationEnum.Classes;
    } else if (widget is TeachersWithTrailing) {
      return NavigationEnum.Teachers;
    } else if (widget is ViewAllStudent) {
      return NavigationEnum.Students;
    } else if (widget is UsersWithTrailing) {
      return NavigationEnum.Users;
    } else if (widget is AddNewStudent) {
      return NavigationEnum.NewStudent;
    } else if (widget is AddNewTeacher) {
      return NavigationEnum.NewTeacher;
    }

    return null;
  }

// TODO:  [add NavigationEnum new screen]

  Widget _createPage(NavigationEnum destination) {
    switch (destination) {
      case NavigationEnum.Dashboard:
        return const DashboardWithTrailing();
      case NavigationEnum.Classes:
        return const ClassesWithTrailing();

      case NavigationEnum.Teachers:
        return const TeachersWithTrailing();
      case NavigationEnum.Students:
        return const ViewAllStudent();
      case NavigationEnum.Users:
        return const UsersWithTrailing();
      case NavigationEnum.NewStudent:
        return const AddNewStudent();
      case NavigationEnum.NewTeacher:
        return const AddNewTeacher();
    }
  }

  @override
  void onInit() {
    _currentPage = const DashboardWithTrailing();
    _navigationStack = [_currentPage];
    super.onInit();
  }
}
