import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
import 'package:repo_viewer/auth/presentation/sing_in_page.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/app_widget.dart';
import 'package:repo_viewer/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/starred_repo_page.dart';
import 'package:repo_viewer/splash/presentation/splash_page.dart';

import '../../auth/application/auth_notifier_test.mocks.dart';
import '../infrastructure/test_database.dart';

@GenerateNiceMocks([MockSpec<GithubAuthenticator>()])
void main() {
  late MockGithubAuthenticator mockGithubAuthenticator;

  setUp(() {
    mockGithubAuthenticator = MockGithubAuthenticator();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        githubAuthenticatorProvider.overrideWith(
          (ref) => mockGithubAuthenticator,
        ),
        sembastProvider.overrideWith((ref) => TestSembastDatabase()),
        initializationProvider.overrideWith((ref) async {
          await ref.read(sembastProvider).init();
          final authNotifier = ref.read(authNotifierProvider.notifier);
          await authNotifier.checkAndUpdateAuthStatus();

          return unit;
        }),
      ],
      child: AppWidget(),
    );
  }

  testWidgets('should push to sign-in page when user is not signed in',
      (tester) async {
    // arrange
    when(mockGithubAuthenticator.isSignedIn()).thenAnswer(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => false,
      ),
    );
    // act
    await tester.pumpWidget(createWidgetUnderTest());
    // assert
    await tester.pump();
    expect(find.byType(SplashPage), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(SplashPage), findsNothing);
    expect(find.byType(StarredReposPage), findsNothing);
    expect(find.byType(SignInPage), findsOneWidget);
  });

  testWidgets('should push to sign in page when user is signed in',
      (tester) async {
    // arrange
    when(mockGithubAuthenticator.isSignedIn()).thenAnswer(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => true,
      ),
    );

    // act
    await tester.pumpWidget(createWidgetUnderTest());

    // assert
    await tester.pump();
    expect(find.byType(SplashPage), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(SplashPage), findsNothing);
    expect(find.byType(SignInPage), findsNothing);
    expect(find.byType(StarredReposPage), findsOneWidget);
  });
}
