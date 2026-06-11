import 'package:freezed_annotation/freezed_annotation.dart';
part 'github_repo_detail.freezed.dart';

@freezed
abstract class GithubRepoDetail with _$GithubRepoDetail {
  const GithubRepoDetail._();
  const factory GithubRepoDetail({
    required String fullName,
    required String html,
    required bool starred,
  }) = _GithubRepoDetail;
}
