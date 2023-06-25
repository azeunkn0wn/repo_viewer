import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/presentation/sing_in_page.dart';
import 'package:repo_viewer/splash/presentation/splash_page.dart';

import '../../../auth/presentation/authorization_page.dart';
import '../../../github/core/domain/github_repo.dart';
import '../../../github/detail/presentation/repo_detail_page.dart';
import '../../../github/repos/searched_repos/presentation/searched_repos_page.dart';
import '../../../github/repos/starred_repos/presentation/starred_repo_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page, path: '/sign-in'),
        AutoRoute(page: AuthorizationRoute.page, path: '/auth'),
        AutoRoute(page: StarredReposRoute.page, path: '/starred'),
        AutoRoute(page: SearchedReposRoute.page, path: '/searched'),
        AutoRoute(page: RepoDetailRoute.page, path: '/detail'),
      ];
}
