// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GithubRepo {
  User get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;

  /// Create a copy of GithubRepo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubRepoCopyWith<GithubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoCopyWith<$Res> {
  factory $GithubRepoCopyWith(
          GithubRepo value, $Res Function(GithubRepo) then) =
      _$GithubRepoCopyWithImpl<$Res, GithubRepo>;
  @useResult
  $Res call({User owner, String name, String description, int stargazersCount});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$GithubRepoCopyWithImpl<$Res, $Val extends GithubRepo>
    implements $GithubRepoCopyWith<$Res> {
  _$GithubRepoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubRepo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? name = null,
    Object? description = null,
    Object? stargazersCount = null,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of GithubRepo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubRepoImplCopyWith<$Res>
    implements $GithubRepoCopyWith<$Res> {
  factory _$$GithubRepoImplCopyWith(
          _$GithubRepoImpl value, $Res Function(_$GithubRepoImpl) then) =
      __$$GithubRepoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User owner, String name, String description, int stargazersCount});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$GithubRepoImplCopyWithImpl<$Res>
    extends _$GithubRepoCopyWithImpl<$Res, _$GithubRepoImpl>
    implements _$$GithubRepoImplCopyWith<$Res> {
  __$$GithubRepoImplCopyWithImpl(
      _$GithubRepoImpl _value, $Res Function(_$GithubRepoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubRepo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? name = null,
    Object? description = null,
    Object? stargazersCount = null,
  }) {
    return _then(_$GithubRepoImpl(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GithubRepoImpl extends _GithubRepo {
  const _$GithubRepoImpl(
      {required this.owner,
      required this.name,
      required this.description,
      required this.stargazersCount})
      : super._();

  @override
  final User owner;
  @override
  final String name;
  @override
  final String description;
  @override
  final int stargazersCount;

  @override
  String toString() {
    return 'GithubRepo(owner: $owner, name: $name, description: $description, stargazersCount: $stargazersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubRepoImpl &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, owner, name, description, stargazersCount);

  /// Create a copy of GithubRepo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubRepoImplCopyWith<_$GithubRepoImpl> get copyWith =>
      __$$GithubRepoImplCopyWithImpl<_$GithubRepoImpl>(this, _$identity);
}

abstract class _GithubRepo extends GithubRepo {
  const factory _GithubRepo(
      {required final User owner,
      required final String name,
      required final String description,
      required final int stargazersCount}) = _$GithubRepoImpl;
  const _GithubRepo._() : super._();

  @override
  User get owner;
  @override
  String get name;
  @override
  String get description;
  @override
  int get stargazersCount;

  /// Create a copy of GithubRepo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubRepoImplCopyWith<_$GithubRepoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
