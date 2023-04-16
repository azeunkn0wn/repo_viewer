
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';

class TestSembastDatabase extends Mock implements SembastDatabase {
  late Database _instance;
  @override
  Database get instance => _instance;
  String path = 'test/db.mockSembast';
  final databaseMemoryFactory = newDatabaseFactoryMemory();
  bool hasBeenInitialized = false;

  @override
  Future<void> init() async {
    if (hasBeenInitialized) return;
    hasBeenInitialized = true;

    _instance = await databaseMemoryFactory.openDatabase(path);
  }

  Future<void> reset() async {
    if (!hasBeenInitialized) return;
    await _instance.close();
    await databaseMemoryFactory.deleteDatabase(path);
    hasBeenInitialized = false;
  }

  Future<void> delete() async {
    await databaseMemoryFactory.deleteDatabase(path);
  }
}
