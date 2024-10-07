import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/search/infrastructure/search_history_repository.dart';

part 'search_history_notifier.freezed.dart';

@freezed
class SearchHistoryState with _$SearchHistoryState {
  const SearchHistoryState._();
  const factory SearchHistoryState.loading(List<String> terms) = _Loading;
  const factory SearchHistoryState.data(List<String> terms) = _Data;
  const factory SearchHistoryState.error(Object error, StackTrace stackTrace) =
      _Error;
}

class SearchHistoryNotifier extends StateNotifier<SearchHistoryState> {
  final SearchHistoryRepository _repository;
  SearchHistoryNotifier(this._repository)
      : super(const SearchHistoryState.loading([]));

  void watchSearchTerms({String? filter}) {
    _repository.watchSearchTerms(filter: filter).listen(
      (data) {
        state = SearchHistoryState.data(data);
      },
      onError: (Object error) {
        state = SearchHistoryState.error(error, StackTrace.current);
      },
    );
  }

  Future<void> addSearchTerm(String term) => _repository.addSearchTerm(term);

  Future<void> deleteSearchTerm(String term) =>
      _repository.deleteSearchTerm(term);

  Future<void> putSearchTermFirst(String term) =>
      _repository.putSearchTermFirst(term);
}
