import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';

import 'secure_credentials_storage_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FlutterSecureStorage>()])
void main() {
  late SecureCredentialsStorage sut;
  late MockFlutterSecureStorage storage;

  final credentials = Credentials(
    'accessToken',
    refreshToken: 'refreshToken',
    idToken: 'idToken',
    tokenEndpoint: Uri(),
    scopes: ['scopes'],
    expiration: DateTime.now(),
  );

  final credentialsJson = credentials.toJson();

  setUp(() {
    storage = MockFlutterSecureStorage();
    sut = SecureCredentialsStorage(storage);
  });

  group('read storage test', () {
    test(
      'should return null if there is no credentials in storage',
      () async {
        // arrange
        when(storage.read(key: anyNamed('key'))).thenAnswer((_) async => null);
        // act
        final result = await sut.read();
        // assert
        verify(storage.read(key: anyNamed('key'))).called(1);
        expect(result, isNull);
      },
    );

    test(
      'should return null if there is a FormatException',
      () async {
        // arrange
        when(storage.read(key: anyNamed('key')))
            .thenAnswer((_) async => 'invalid json');
        // act
        final result = await sut.read();
        // assert
        verify(storage.read(key: anyNamed('key'))).called(1);
        expect(result, isNull);
      },
    );

    test(
      'should return credentials if there is a valid credentials in storage',
      () async {
        // arrange
        when(storage.read(key: anyNamed('key')))
            .thenAnswer((_) async => credentialsJson);
        // act
        final result = await sut.read();

        // assert
        verify(storage.read(key: anyNamed('key'))).called(1);
        expect(result, isA<Credentials>());
      },
    );
  });

  group('save test', () {
    test(
      'should store credentials to secure storage',
      () async {
        // arrange

        // act
        sut.save(credentials);

        // assert
        verify(storage.write(key: anyNamed('key'), value: anyNamed('value')))
            .called(1);
        final result = await sut.read();
        expect(result, credentials);
      },
    );
    test(
      'should store credentials to secure storage and return the same credentials when read',
      () async {
        // arrange

        // act
        sut.save(credentials);
        final result = await sut.read();

        // assert
        expect(result, credentials);
      },
    );
  });

  group('clear test', () {
    test(
      'should clear credentials from secure storage and memory',
      () async {
        // arrange
        await sut.save(credentials);
        expect(await sut.read(), credentials);

        // act
        await sut.clear();
        final result = await sut.read();

        // assert
        verify(storage.delete(key: anyNamed('key'))).called(1);
        expect(result, isNull);
      },
    );
  });
}
