import 'package:flutter_test/flutter_test.dart';
import 'package:repo_viewer/search/application/search_history_notifier.dart';
import 'package:repo_viewer/search/infrastructure/search_history_repository.dart';

import '../../core/infrastructure/test_database.dart';

void main() {
  late SearchHistoryRepository repository;
  late SearchHistoryNotifier sut;
  late TestSembastDatabase db;

  setUp(() {
    db = TestSembastDatabase();
    repository = SearchHistoryRepository(db);
    sut = SearchHistoryNotifier(repository);
  });

  test(
    'initial values are correct',
    () async {
      // arrange
      await db.reset();
      await db.init();
      // assert
      expect(sut.debugState, const SearchHistoryState.loading([]));

      expect(db.hasBeenInitialized, true);
    },
  );

  test(
    'should get watchSearchTerms',
    () async {
      // assert
      expectLater(
        sut.stream,
        emitsInOrder([
          const SearchHistoryState.data([]),
          const SearchHistoryState.data(['term1']),
          const SearchHistoryState.data(['term2', 'term1']),
        ]),
      );

      // arrange
      await db.reset();
      await db.init();
      sut.watchSearchTerms();

      // act
      await sut.addSearchTerm('term1');
      await sut.addSearchTerm('term2');
    },
  );
}

// TODO: Create more tests
