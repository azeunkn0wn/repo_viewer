import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:repo_viewer/github/shared/providers.dart';

class SearchedReposPage extends ConsumerStatefulWidget {
  final String searchTerm;

  const SearchedReposPage({super.key, required this.searchTerm});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(searchedReposNotifierProvider.notifier)
          .getNextStarredReposPage(widget.searchTerm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.searchTerm),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
            icon: const Icon(MdiIcons.logoutVariant),
          ),
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        getNextPage: (ref, context) {
          ref
              .read(searchedReposNotifierProvider.notifier)
              .getNextStarredReposPage(widget.searchTerm);
        },
        noResultMessage: "Nothing found. Try another search terms",
      ),
    );
  }
}
