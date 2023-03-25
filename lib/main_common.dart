import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/config_reader.dart';

import 'package:repo_viewer/core/presentation/app_widget.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  await dotenv.load(fileName: ConfigReader.getEnv(env));

  runApp(ProviderScope(child: AppWidget()));
}
