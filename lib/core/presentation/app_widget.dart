import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:repo_viewer/auth/shared/provider.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';

final initializationProvider = FutureProvider((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class MainApp extends ConsumerWidget {
  MainApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      initializationProvider,
      (_, __) => {},
    );

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        authenticated: (_) {
          appRouter.pushAndPopUntil(
            const StarredReposRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (_) {
          appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        },
      );
    });
    return MaterialApp.router(
      title: 'Repo Viewer',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}