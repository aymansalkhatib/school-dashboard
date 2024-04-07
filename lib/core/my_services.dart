import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:sama/model/finance_model.dart';
import 'package:sama/model/section_model.dart';
import 'package:sama/model/student_model.dart';
import 'package:sama/model/teacher_model.dart';

class MyAppServices extends GetxService {
  late Box box;

  static final MyAppServices _instance = MyAppServices._internal();

  factory MyAppServices() {
    return _instance;
  }

  MyAppServices._internal();

  Future<void> initialize() async {
    String? homeDir = Platform.environment['USERPROFILE'] ?? // Windows
        Platform.environment['HOME']; // Linux and Mac

    if (homeDir == null) {
      throw Exception('Home directory not found');
    }

    // Specify the directory for Hive data storage
    // String hiveDataDir = path.join('D:', 'sama22');
    String hiveDataDir = path.join(homeDir, 'Desktop', 'sama');

    // Create the Hive data directory if it doesn't exist
    Directory hiveDirectory = Directory(hiveDataDir);
    if (!hiveDirectory.existsSync()) {
      hiveDirectory.createSync(recursive: true);
    }
    Hive.init(hiveDataDir);
    box = await Hive.openBox('SAMA');
    print("init service");
  }

  Future<void> putValue(String key, String? value) async {
    await box.put(key, value);
  }

  String getValue(String key, {String defaultValue = ''}) {
    return box.get(key, defaultValue: defaultValue) ?? '';
  }

  Future<void> removeValue(String key) async {
    await box.delete(key);
  }
}

Future<void> initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(FinanceModelAdapter());
  Hive.registerAdapter(TeacherModelAdapter());
  Hive.registerAdapter(SectionModelAdapter());
  await MyAppServices().initialize();
}
