import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _unauthenticated;
  const factory AuthState.authenticated() = _authenticated;
  const factory AuthState.failure(AuthFailure failure) = _failure;
}
