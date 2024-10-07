// ignore_for_file: invalid_use_of_protected_member

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';

import 'auth_notifier_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<GithubAuthenticator>(),
  ],
)
void main() {
  late AuthNotifier sut;
  late MockGithubAuthenticator mockAuthenticator;

  setUp(() {
    mockAuthenticator = MockGithubAuthenticator();
    sut = AuthNotifier(mockAuthenticator);
  });
  test('auth notifier initial values are correct', () async {
    expect(sut.state, const AuthState.initial());
  });

  group('checkAndUpdateAuthStatus', () {
    test(
      'should get the correct state when user is signed in',
      () async {
        // arrange
        when(mockAuthenticator.isSignedIn()).thenAnswer((_) async => true);

        // act
        await sut.checkAndUpdateAuthStatus();

        // assert
        verify(mockAuthenticator.isSignedIn()).called(1);
        expect(sut.state, const AuthState.authenticated());
      },
    );
    test(
      'should get the correct state when user is signed in',
      () async {
        // arrange
        when(mockAuthenticator.isSignedIn()).thenAnswer((_) async => false);

        // act
        await sut.checkAndUpdateAuthStatus();

        // assert
        verify(mockAuthenticator.isSignedIn()).called(1);
        expect(sut.state, const AuthState.unauthenticated());
      },
    );

    group('signIn', () {
      test(
        'should get authenticated state when user signed in successfully',
        () async {
          // arrange
          when(mockAuthenticator.createGrant()).thenReturn(
            AuthorizationCodeGrant(
              'test',
              Uri(),
              Uri(),
            ),
          );
          when(mockAuthenticator.getAuthorizationUrl(any))
              .thenReturn(Uri(path: 'test'));
          when(mockAuthenticator.handleAuthorizationResponse(any, any))
              .thenAnswer((_) async => right(unit));
          // act
          await sut.signIn((_) async => Uri());
          // assert
          verify(mockAuthenticator.createGrant()).called(1);
          verify(mockAuthenticator.getAuthorizationUrl(any)).called(1);
          verify(mockAuthenticator.handleAuthorizationResponse(any, any))
              .called(1);
          expect(sut.state, const AuthState.authenticated());
        },
      );
      test(
        'should get a failure state: AuthFailure.server() when user server failed to authenticate user',
        () async {
          // arrange
          when(mockAuthenticator.createGrant()).thenReturn(
            AuthorizationCodeGrant(
              'test',
              Uri(),
              Uri(),
            ),
          );
          when(mockAuthenticator.getAuthorizationUrl(any))
              .thenReturn(Uri(path: 'test'));
          when(mockAuthenticator.handleAuthorizationResponse(any, any))
              .thenAnswer((_) async => left(const AuthFailure.server()));
          // act
          await sut.signIn((_) async => Uri());
          // assert
          verify(mockAuthenticator.createGrant()).called(1);
          verify(mockAuthenticator.getAuthorizationUrl(any)).called(1);
          verify(mockAuthenticator.handleAuthorizationResponse(any, any))
              .called(1);
          expect(sut.state, const AuthState.failure(AuthFailure.server()));
        },
      );

      test(
        'should get a failure state: AuthFailure.storage() when user storage failed to store user credentials',
        () async {
          // arrange
          when(mockAuthenticator.createGrant()).thenReturn(
            AuthorizationCodeGrant(
              'test',
              Uri(),
              Uri(),
            ),
          );
          when(mockAuthenticator.getAuthorizationUrl(any))
              .thenReturn(Uri(path: 'test'));
          when(mockAuthenticator.handleAuthorizationResponse(any, any))
              .thenAnswer((_) async => left(const AuthFailure.storage()));
          // act
          await sut.signIn((_) async => Uri());
          // assert
          verify(mockAuthenticator.createGrant()).called(1);
          verify(mockAuthenticator.getAuthorizationUrl(any)).called(1);
          verify(mockAuthenticator.handleAuthorizationResponse(any, any))
              .called(1);
          expect(sut.state, const AuthState.failure(AuthFailure.storage()));
        },
      );
    });
  });

  group('signOut', () {
    test(
      'should get an unauthenticated state when user signed out successfully',
      () async {
        // arrange
        when(mockAuthenticator.signOut()).thenAnswer((_) async => right(unit));
        // act
        await sut.signOut();

        // assert
        verify(mockAuthenticator.signOut()).called(1);
        expect(sut.state, const AuthState.unauthenticated());
      },
    );

    test(
      'should get a failure state when user signed out unsuccessfully',
      () async {
        // arrange
        when(mockAuthenticator.signOut())
            .thenAnswer((_) async => left(const AuthFailure.storage()));
        // act
        await sut.signOut();

        // assert
        verify(mockAuthenticator.signOut()).called(1);
        expect(sut.state, const AuthState.failure(AuthFailure.storage()));
      },
    );
  });
}
