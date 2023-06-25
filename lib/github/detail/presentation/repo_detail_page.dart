import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/core/presentation/toast.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/core/presentation/no_results_displayed.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/detail/application/repo_detail_notifier.dart';
import 'package:repo_viewer/github/detail/presentation/css.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class RepoDetailPage extends ConsumerStatefulWidget {
  final GithubRepo repo;
  const RepoDetailPage({super.key, required this.repo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends ConsumerState<RepoDetailPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(repoDetailNotifierProvider.notifier)
          .getRepoDetail(widget.repo.fullName),
    );

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (navReq) {
            if (navReq.url.startsWith('data:')) {
              return NavigationDecision.navigate;
            } else {
              url_launcher.launchUrl(Uri.parse(navReq.url));
              return NavigationDecision.prevent;
            }
          },
        ),
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
        body: state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadFailure: (_) => Center(
            child: Text(_.failure.toString()),
          ),
          loadSuccess: (_) {
            if (_.repoDetail.entity == null) {
              return const NoResultsDisplay(message: "Nothing to show");
            } else {
              _controller.loadHtmlString(
                '''
                <html>
                  <head>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  </head>
                <body>
                  ${_.repoDetail.entity!.html}
                </body>
                </html>
                  $style
              ''',
              );

              return WebViewWidget(controller: _controller);
            }
          },
        ),
      ),
    );
  }

  final style = """
            <style>
              $css
            </style>
            """;
}
