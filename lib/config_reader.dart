// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getEnv(String env) {
    return '${_config['env']}.$env';
  }
}
