import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:repo_viewer/search/infrastructure/search_history_repository.dart';

import '../../core/infrastructure/test_database.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TestSembastDatabase db;

  late SearchHistoryRepository sut;
  List<String> searchTerms = [];

  setUp(() async {
    db = TestSembastDatabase();
    sut = SearchHistoryRepository(db);
    await db.reset();
    await db.init();
  });

  test('should returns empty list when no terms are present', () async {
    // arrange
    await db.reset();
    await db.init();

    // assert
    expectLater(
      sut.watchSearchTerms(),
      emitsInOrder(
        [
          [],
        ],
      ),
    );
  });

  test('should add and return [term1] in search terms', () async {
    // arrange
    await db.reset();
    await db.init();
    // assert
    expectLater(
      sut.watchSearchTerms(),
      emitsInOrder(
        [
          [],
          ['term1'],
        ],
      ),
    );
    // act
    await sut.addSearchTerm('term1');
  });
  test(
    'should return an empty list when delete term2 from search terms when deleteSearchTerm is called',
    () async {
      // arrange
      await db.reset();
      await db.init();
      // assert
      expectLater(
        sut.watchSearchTerms(),
        emitsInOrder(
          [
            [],
            ['term1'],
            ['term2', 'term1'],
            ['term3', 'term2', 'term1'],
            ['term3', 'term1']
          ],
        ),
      );
      // act
      await sut.addSearchTerm('term1');
      await sut.addSearchTerm('term2');
      await sut.addSearchTerm('term3');
      await sut.deleteSearchTerm('term2');
    },
  );

  test(
    'should do nothing when deleting a term that does not exist',
    () async {
      // arrange
      await db.reset();
      await db.init();
      // assert
      expectLater(
        sut.watchSearchTerms(),
        emitsInOrder(
          [
            [],
          ],
        ),
      );
      // act
      await sut.deleteSearchTerm('non-existing-term');
    },
  );

  test(
    'should put the latest searched term at the last of the list when putSearchTermFirst is called',
    () async {
      // arrange
      await db.reset();
      await db.init();
      // assert
      expectLater(
        sut.watchSearchTerms(),
        emitsInOrder(
          [
            [],
            ['term1'],
            ['term2', 'term1'],
            ['term1', 'term2'],
          ],
        ),
      );
      // act
      await sut.addSearchTerm('term1');
      await sut.addSearchTerm('term2');
      await sut.addSearchTerm('term1');
    },
  );

  test('should returns all terms when no filter is provided', () async {
    // arrange
    await db.reset();
    await db.init();
    // assert
    expectLater(
      sut.watchSearchTerms(),
      emitsInOrder(
        [
          [],
          ['term1'],
          ['term2', 'term1'],
          ['term3', 'term2', 'term1'],
        ],
      ),
    );
    // act
    await sut.addSearchTerm('term1');
    await sut.addSearchTerm('term2');
    await sut.addSearchTerm('term3');
  });

  test(
      'returns searched terms with the latest term at first of the list when no filter is provided',
      () async {
    // arrange
    await db.reset();
    await db.init();
    // assert
    expectLater(
      sut.watchSearchTerms(),
      emitsInOrder(
        [
          [],
          ['term1'],
          ['term2', 'term1'],
          ['term3', 'term2', 'term1'],
          ['term1', 'term3', 'term2'],
        ],
      ),
    );
    // act
    await sut.addSearchTerm('term1');
    await sut.addSearchTerm('term2');
    await sut.addSearchTerm('term3');
    await sut.addSearchTerm('term1');
  });

  test(
    'should return only the last 10 searched terms after searching for 11 terms and without filter',
    () async {
      // arrange
      await db.reset();
      await db.init();
      // assert

      expectLater(
        sut.watchSearchTerms(),
        emitsInOrder(
          [
            [],
            ['term1'],
            ['term2', 'term1'],
            ['term3', 'term2', 'term1'],
            ['term4', 'term3', 'term2', 'term1'],
            ['term5', 'term4', 'term3', 'term2', 'term1'],
            ['term6', 'term5', 'term4', 'term3', 'term2', 'term1'],
            ['term7', 'term6', 'term5', 'term4', 'term3', 'term2', 'term1'],
            [
              'term8',
              'term7',
              'term6',
              'term5',
              'term4',
              'term3',
              'term2',
              'term1'
            ],
            [
              'term9',
              'term8',
              'term7',
              'term6',
              'term5',
              'term4',
              'term3',
              'term2',
              'term1'
            ],
            [
              'term10',
              'term9',
              'term8',
              'term7',
              'term6',
              'term5',
              'term4',
              'term3',
              'term2',
              'term1'
            ],
            [
              'term11',
              'term10',
              'term9',
              'term8',
              'term7',
              'term6',
              'term5',
              'term4',
              'term3',
              'term2',
              'term1'
            ],
            [
              'term11',
              'term10',
              'term9',
              'term8',
              'term7',
              'term6',
              'term5',
              'term4',
              'term3',
              'term2'
            ],
          ],
        ),
      );
      // act
      for (final i in Iterable<int>.generate(11)) {
        await sut.addSearchTerm('term${i + 1}');
      }
    },
  );

  //TODO: fix this test
  group('filtered search term test', () {
    StreamSubscription<List<String>>? subscription;
    Future<void> dispose() async {
      await subscription?.cancel();
    }

    Future<void> watch(Stream<List<String>> stream) async {
      subscription = stream.listen(
        (data) {
          searchTerms = data;
        },
      );
      await Future.delayed(const Duration(milliseconds: 100));
      await dispose();
      return;
    }

    setUp(() async {
      db = TestSembastDatabase();
      sut = SearchHistoryRepository(db);

      await db.reset();
      await db.init();
      await sut.addSearchTerm('term1');
      await sut.addSearchTerm('term12');
      await sut.addSearchTerm('term123');
      await sut.addSearchTerm('term1234');
      await sut.addSearchTerm('term12345');
      await sut.addSearchTerm('term123456');
      await sut.addSearchTerm('excluded term');
    });

    test(
      'should only have list of searched terms that matches the filter',
      () async {
        //act
        await watch(sut.watchSearchTerms(filter: 'term'));
        final filteredTerms1 = searchTerms;

        await watch(sut.watchSearchTerms(filter: 'term1'));
        final filteredTerms2 = searchTerms;

        await watch(sut.watchSearchTerms(filter: 'term12'));
        final filteredTerms3 = searchTerms;

        await watch(sut.watchSearchTerms(filter: 'term123'));
        final filteredTerms4 = searchTerms;

        //assert
        expect(filteredTerms1, [
          'term123456',
          'term12345',
          'term1234',
          'term123',
          'term12',
          'term1'
        ]);
        expect(filteredTerms2, [
          'term123456',
          'term12345',
          'term1234',
          'term123',
          'term12',
          'term1'
        ]);
        expect(filteredTerms3, [
          'term123456',
          'term12345',
          'term1234',
          'term123',
          'term12',
        ]);
        expect(filteredTerms4, [
          'term123456',
          'term12345',
          'term1234',
          'term123',
        ]);
      },
    );
    test(
      'should not include term that does not match the filter',
      () async {
        // act
        await watch(sut.watchSearchTerms(filter: 'term'));
        // assert
        expect(searchTerms.contains('excluded term'), false);
      },
    );
  });
}
