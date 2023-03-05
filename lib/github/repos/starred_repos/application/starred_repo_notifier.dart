import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/core/domain/fresh.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';

part 'starred_repo_notifier.freezed.dart';

@freezed
class StarredRepoState with _$StarredRepoState {
  const StarredRepoState._();
  const factory StarredRepoState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;

  const factory StarredRepoState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;

  const factory StarredRepoState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;

  const factory StarredRepoState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _LoadFailure;
}
