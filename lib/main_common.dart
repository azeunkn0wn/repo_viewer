import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/config_reader.dart';

import 'package:repo_viewer/core/presentation/app_widget.dart';
import 'package:repo_viewer/env_loader.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  await EnvLoader().load(env);

  runApp(ProviderScope(child: AppWidget()));
}
