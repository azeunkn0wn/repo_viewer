import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/presentation/toast.dart';
import 'package:repo_viewer/github/core/presentation/no_results_displayed.dart';
import 'package:repo_viewer/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repo_viewer/github/repos/core/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/github/repos/core/presentation/loading_repo_tile.dart';
import 'package:repo_viewer/github/repos/core/presentation/repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  final StateNotifierProvider<PaginatedReposNotifier, PaginatedReposState>
      paginatedReposNotifierProvider;
  final void Function(WidgetRef ref, BuildContext context) getNextPage;
  final String noResultMessage;

  const PaginatedReposListView({
    super.key,
    required this.paginatedReposNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
  });

  @override
  State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(widget.paginatedReposNotifierProvider);
        ref.listen<PaginatedReposState>(widget.paginatedReposNotifierProvider,
            (_, state) {
          state.map(
            initial: (_) => canLoadNextPage = true,
            loadInProgress: (_) => canLoadNextPage = false,
            loadSuccess: (_) {
              if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
                hasAlreadyShownNoConnectionToast = true;
                showNoConnectionToast(
                  "You're offline. Some information may be outdated.",
                  context,
                );
              }
              canLoadNextPage = _.isNextPageAvailable;
            },
            loadFailure: (_) => canLoadNextPage = false,
          );
        });
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final metrics = notification.metrics;
            final limit =
                metrics.maxScrollExtent - metrics.viewportDimension / 3;

            if (canLoadNextPage && metrics.pixels >= limit) {
              canLoadNextPage = false;

              widget.getNextPage(ref, context);
              return true;
            }
            return false;
          },
          child: state.maybeWhen(
            loadSuccess: (repos, _) => repos.entity.isEmpty,
            orElse: () => false,
          )
              ? NoResultsDisplay(message: widget.noResultMessage)
              : _PaginatedListVIew(state: state),
        );
      },
    );
  }
}

class _PaginatedListVIew extends StatelessWidget {
  final PaginatedReposState state;

  const _PaginatedListVIew({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadSuccess: (_) => _.repos.entity.length,
        loadFailure: (_) => _.repos.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => RepoTile(repo: _.repos.entity[index]),
          loadInProgress: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            } else {
              return const LoadingRepoTile();
            }
          },
          loadSuccess: (_) => RepoTile(
            repo: _.repos.entity[index],
          ),
          loadFailure: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            } else {
              return FailureRepoTile(
                failure: _.failure,
              );
            }
          },
        );
      },
    );
  }
}
