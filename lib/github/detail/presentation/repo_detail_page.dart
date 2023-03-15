import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/core/presentation/toast.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/detail/application/repo_detail_notifier.dart';
import 'package:shimmer/shimmer.dart';

class RepoDetailPage extends ConsumerStatefulWidget {
  final GithubRepo repo;
  const RepoDetailPage({super.key, required this.repo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends ConsumerState<RepoDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(repoDetailNotifierProvider.notifier)
          .getRepoDetail(widget.repo.fullName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(repoDetailNotifierProvider);
    ref.listen<RepoDetailState>(
      repoDetailNotifierProvider,
      (_, state) {
        state.maybeWhen(
          orElse: () {},
          loadSuccess: (repoDetail, _) {
            if (!repoDetail.isFresh) {
              showNoConnectionToast(
                "You're offline. Some information may be outdated.",
                context,
              );
            }
          },
        );
      },
    );

    return WillPopScope(
      onWillPop: () async {
        if (state.hasStarredStatusChanged) {
          ref
              .read(starredReposNotifierProvider.notifier)
              .getFirstStarredReposPage();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Hero(
                tag: widget.repo.fullName,
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: CachedNetworkImageProvider(
                    widget.repo.owner.avatarUrlSmall,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  widget.repo.name,
                ),
              )
            ],
          ),
          actions: [
            state.maybeMap(
              orElse: () => Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade300,
                child: IconButton(
                  icon: const Icon(Icons.star),
                  onPressed: null,
                  disabledColor: Theme.of(context).iconTheme.color,
                ),
              ),
              loadSuccess: (state) {
                return IconButton(
                  icon: Icon(
                    !state.repoDetail.isFresh
                        ? MdiIcons.starRemoveOutline
                        : state.repoDetail.entity?.starred == true
                            ? Icons.star
                            : Icons.star_outline,
                  ),
                  onPressed: !state.repoDetail.isFresh
                      ? null
                      : () {
                          ref
                              .read(repoDetailNotifierProvider.notifier)
                              .switchStarredStatus(state.repoDetail.entity!);
                        },
                );
              },
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
