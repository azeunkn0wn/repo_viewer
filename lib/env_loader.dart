import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:repo_viewer/config_reader.dart';

class EnvLoader {
  static const _requiredEnvVars = [
    'GITHUB_CLIENT_ID',
    'GITHUB_CLIENT_SECRET',
    'GITHUB_ACCESS_TOKEN',
  ];

  Future<void> load(String env) async {
    final fileName = ConfigReader.getEnv(env);
    const filenameOverride = 'env/.env';
    try {
      await dotenv.load(fileName: filenameOverride);
      if (!dotenv.isEveryDefined(_requiredEnvVars)) {
        throw Exception(
          '$filenameOverride - Missing required environment variables',
        );
      }
    } catch (e) {
      try {
        await dotenv.load(fileName: fileName);
        if (!dotenv.isEveryDefined(_requiredEnvVars)) {
          throw Exception(
            '$fileName - Missing required environment variables',
          );
        }
      } catch (e) {
        throw Exception('Failed to load environment variables. error: \n$e');
      }
    }
  }
}
