import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:repo_viewer/search/shared/providers.dart';

class SearchBar extends ConsumerStatefulWidget {
  final Widget body;
  final String title;
  final String hint;
  final void Function(String searchTerm) onShouldNavigateToResultPage;
  final void Function() onSignOutButtonPressed;
  const SearchBar({
    required this.body,
    required this.title,
    required this.hint,
    required this.onShouldNavigateToResultPage,
    required this.onSignOutButtonPressed,
  });
  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late final FloatingSearchBarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = FloatingSearchBarController();
    ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _controller,
      body: FloatingSearchBarScrollNotifier(child: widget.body),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Text('Tap to search 👆'),
        ],
      ),
      hint: widget.hint,
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction(
          child: IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: () {
              widget.onSignOutButtonPressed();
            },
          ),
        )
      ],
      onSubmitted: (query) {
        widget.onShouldNavigateToResultPage(query);
        ref.read(searchHistoryNotifierProvider.notifier).addSearchTerm(query);
        _controller.close();
      },
      builder: (context, transition) {
        return Consumer(
          builder: (context, ref, child) {
            final searchHistory = ref.watch(searchHistoryNotifierProvider);

            return searchHistory.map(
              data: (history) {
                return Column(
                  children: history.value
                      .map(
                        (term) => ListTile(
                          title: Text(term),
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
          },
        );
      },
    );
  }
}
