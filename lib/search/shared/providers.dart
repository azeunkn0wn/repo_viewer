import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/shared/providers.dart';
import 'package:repo_viewer/search/application/search_history_notifier.dart';
import 'package:repo_viewer/search/infrastructure/search_history_repository.dart';

final searchHistoryRepository = Provider(
  (ref) => SearchHistoryRepository(
    ref.watch(sembastProvider),
  ),
);

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(
    ref.watch(searchHistoryRepository),
  ),
);
