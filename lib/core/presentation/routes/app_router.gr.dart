// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthorizationPage(
          key: args.key,
          authorizationUrl: args.authorizationUrl,
          onAuthorizationCodeRedirectAttempt:
              args.onAuthorizationCodeRedirectAttempt,
        ),
      );
    },
    RepoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RepoDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RepoDetailPage(
          key: args.key,
          repo: args.repo,
        ),
      );
    },
    SearchedReposRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedReposRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchedReposPage(
          key: args.key,
          searchTerm: args.searchTerm,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    StarredReposRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StarredReposPage(),
      );
    },
  };
}

/// generated route for
/// [AuthorizationPage]
class AuthorizationRoute extends PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute({
    Key? key,
    required Uri authorizationUrl,
    required void Function(Uri) onAuthorizationCodeRedirectAttempt,
    List<PageRouteInfo>? children,
  }) : super(
          AuthorizationRoute.name,
          args: AuthorizationRouteArgs(
            key: key,
            authorizationUrl: authorizationUrl,
            onAuthorizationCodeRedirectAttempt:
                onAuthorizationCodeRedirectAttempt,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthorizationRoute';

  static const PageInfo<AuthorizationRouteArgs> page =
      PageInfo<AuthorizationRouteArgs>(name);
}

class AuthorizationRouteArgs {
  const AuthorizationRouteArgs({
    this.key,
    required this.authorizationUrl,
    required this.onAuthorizationCodeRedirectAttempt,
  });

  final Key? key;

  final Uri authorizationUrl;

  final void Function(Uri) onAuthorizationCodeRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationCodeRedirectAttempt: $onAuthorizationCodeRedirectAttempt}';
  }
}

/// generated route for
/// [RepoDetailPage]
class RepoDetailRoute extends PageRouteInfo<RepoDetailRouteArgs> {
  RepoDetailRoute({
    Key? key,
    required GithubRepo repo,
    List<PageRouteInfo>? children,
  }) : super(
          RepoDetailRoute.name,
          args: RepoDetailRouteArgs(
            key: key,
            repo: repo,
          ),
          initialChildren: children,
        );

  static const String name = 'RepoDetailRoute';

  static const PageInfo<RepoDetailRouteArgs> page =
      PageInfo<RepoDetailRouteArgs>(name);
}

class RepoDetailRouteArgs {
  const RepoDetailRouteArgs({
    this.key,
    required this.repo,
  });

  final Key? key;

  final GithubRepo repo;

  @override
  String toString() {
    return 'RepoDetailRouteArgs{key: $key, repo: $repo}';
  }
}

/// generated route for
/// [SearchedReposPage]
class SearchedReposRoute extends PageRouteInfo<SearchedReposRouteArgs> {
  SearchedReposRoute({
    Key? key,
    required String searchTerm,
    List<PageRouteInfo>? children,
  }) : super(
          SearchedReposRoute.name,
          args: SearchedReposRouteArgs(
            key: key,
            searchTerm: searchTerm,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchedReposRoute';

  static const PageInfo<SearchedReposRouteArgs> page =
      PageInfo<SearchedReposRouteArgs>(name);
}

class SearchedReposRouteArgs {
  const SearchedReposRouteArgs({
    this.key,
    required this.searchTerm,
  });

  final Key? key;

  final String searchTerm;

  @override
  String toString() {
    return 'SearchedReposRouteArgs{key: $key, searchTerm: $searchTerm}';
  }
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StarredReposPage]
class StarredReposRoute extends PageRouteInfo<void> {
  const StarredReposRoute({List<PageRouteInfo>? children})
      : super(
          StarredReposRoute.name,
          initialChildren: children,
        );

  static const String name = 'StarredReposRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
