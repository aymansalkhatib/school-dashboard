import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;

class MyAppServices extends GetxService {
  late Box<String?> _information;

  // Singleton pattern
  static final MyAppServices _instance = MyAppServices._internal();

  factory MyAppServices() {
    return _instance;
  }

  MyAppServices._internal();

  Future<Box<String?>> get information async {
    if (_information.isOpen) {
      return _information;
    } else {
      await initialize();
      return _information;
    }
  }

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

    // Initialize Hive with the specified directory
    Hive.init(hiveDataDir);

    // Open the Hive box
    _information = await Hive.openBox('SAMA');
  }

  Future<void> putValue(String key, String? value) async {
    await _information.put(key, value);
  }

  String getValue(String key, {String defaultValue = ''}) {
    return _information.get(key, defaultValue: defaultValue) ?? '';
  }

  Future<void> removeValue(String key) async {
    await _information.delete(key);
  }
}

Future<void> initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyAppServices().initialize();
}
