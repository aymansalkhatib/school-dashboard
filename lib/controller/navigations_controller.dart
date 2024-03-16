import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/view/classes/classes_with_trailing.dart';
import 'package:sama/view/dashboard/dashboard_with_trailing.dart';
import 'package:sama/view/student/widgets/student_with_triling.dart';
import 'package:sama/view/teacher/teacher_with_trailing.dart';
import 'package:sama/view/users/users_with_trailing.dart';

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
    } else if (widget is StudentWithTrailing) {
      return NavigationEnum.Students;
    } else if (widget is UsersWithTrailing) {
      return NavigationEnum.User;
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
        return const StudentWithTrailing();
      case NavigationEnum.User:
        return const UsersWithTrailing();
    }
  }

  @override
  void onInit() {
    _currentPage = const DashboardWithTrailing();
    _navigationStack = [_currentPage];
    super.onInit();
  }
}
