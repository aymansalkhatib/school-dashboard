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
    if (_navigationStack.length > 1) {
      _navigationStack.removeLast();
      _currentPage = _navigationStack.last;
      update();
    } else {
      debugPrint("one screen in stack");
    }
  }

  void replaceLastWidget(NavigationEnum destination) {
    _currentPage = _getPage(destination) ?? _createPage(destination);
    _navigationStack.clear();
    _navigationStack.add(_currentPage);
    update();
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
    } else if (widget is ViewAllTeacher) {
      return NavigationEnum.Teachers;
    } else if (widget is AddNewStudent) {
      return NavigationEnum.AddNewStudent;
    } else if (widget is AddNewTeacher) {
      return NavigationEnum.AddNewTeacher;
    }
    return null;
  }

// TODO:  [add NavigationEnum new screen]

  Widget _createPage(NavigationEnum destination) {
    print("Created Widget");
    switch (destination) {
      case NavigationEnum.Dashboard:
        return const DashboardWithTrailing();
      case NavigationEnum.Classes:
        return const ClassesWithTrailing();

      case NavigationEnum.Teachers:
        return const ViewAllTeacher();
      case NavigationEnum.Students:
        return const ViewAllStudent();
      case NavigationEnum.Users:
        return const UsersWithTrailing();
      case NavigationEnum.AddNewStudent:
        return const AddNewStudent();
      case NavigationEnum.AddNewTeacher:
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
