import 'package:repo_viewer/environment.dart';

import 'package:repo_viewer/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.prod);
}
