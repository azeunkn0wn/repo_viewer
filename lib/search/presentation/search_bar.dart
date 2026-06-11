import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/search/application/search_history_notifier.dart';
import 'package:repo_viewer/search/shared/providers.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  final Widget body;
  final String title;
  final String hint;
  final void Function(String searchTerm) onShouldNavigateToResultPage;
  final void Function() onSignOutButtonPressed;
  const CustomSearchBar({
    super.key,
    required this.body,
    required this.title,
    required this.hint,
    required this.onShouldNavigateToResultPage,
    required this.onSignOutButtonPressed,
  });
  @override
  ConsumerState<CustomSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<CustomSearchBar> {
  final SearchController _searchController = SearchController();

  @override
  void initState() {
    super.initState();
    ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateAndClose(String searchTerm, {required bool putFirst}) {
    widget.onShouldNavigateToResultPage(searchTerm);
    final notifier = ref.read(searchHistoryNotifierProvider.notifier);
    if (putFirst) {
      notifier.putSearchTermFirst(searchTerm);
    } else {
      notifier.addSearchTerm(searchTerm);
    }
    if (_searchController.isOpen) {
      _searchController.closeView(searchTerm);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canPop = AutoRouter.of(context).canPop();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              children: [
                if (canPop)
                  BackButton(
                    onPressed: () => AutoRouter.of(context).maybePop(),
                  ),
                Expanded(
                  child: SearchAnchor(
                    searchController: _searchController,
                    viewHintText: widget.hint,
                    isFullScreen: false,
                    builder: (context, controller) {
                      return SearchBar(
                        controller: controller,
                        hintText: widget.title,
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(Icons.search),
                        ),
                        onTap: controller.openView,
                        onChanged: (_) => controller.openView(),
                      );
                    },
                    viewOnChanged: (query) {
                      ref
                          .read(searchHistoryNotifierProvider.notifier)
                          .watchSearchTerms(filter: query);
                    },
                    viewOnSubmitted: (query) =>
                        _navigateAndClose(query, putFirst: false),
                    suggestionsBuilder: (context, controller) {
                      return [
                        _SearchHistorySuggestions(
                          query: controller.text,
                          onTermSelected: (term) =>
                              _navigateAndClose(term, putFirst: true),
                          onQuerySubmitted: (term) =>
                              _navigateAndClose(term, putFirst: false),
                        ),
                      ];
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: widget.onSignOutButtonPressed,
                ),
              ],
            ),
          ),
        ),
        Expanded(child: widget.body),
      ],
    );
  }
}

class _SearchHistorySuggestions extends ConsumerWidget {
  final String query;
  final void Function(String term) onTermSelected;
  final void Function(String term) onQuerySubmitted;
  const _SearchHistorySuggestions({
    required this.query,
    required this.onTermSelected,
    required this.onQuerySubmitted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistory = ref.watch(searchHistoryNotifierProvider);
    return searchHistory.map(
      data: (history) {
        if (query.isEmpty && history.terms.isEmpty) {
          return Container(
            height: 56,
            alignment: Alignment.center,
            child: Text(
              'Start searching',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        } else if (history.terms.isEmpty) {
          return ListTile(
            title: Text(query),
            leading: const Icon(Icons.search),
            onTap: () => onQuerySubmitted(query),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: history.terms
              .map(
                (term) => ListTile(
                  title: Text(
                    term,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: const Icon(Icons.history),
                  trailing: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      ref
                          .read(searchHistoryNotifierProvider.notifier)
                          .deleteSearchTerm(term);
                    },
                  ),
                  onTap: () => onTermSelected(term),
                ),
              )
              .toList(),
        );
      },
      loading: (_) => const ListTile(
        title: LinearProgressIndicator(),
      ),
      error: (_) => ListTile(
        title: Text('Very unexpected error ${_.error}'),
      ),
    );
  }
}
