// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepoDetailState {
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoDetailStateCopyWith<RepoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDetailStateCopyWith<$Res> {
  factory $RepoDetailStateCopyWith(
          RepoDetailState value, $Res Function(RepoDetailState) then) =
      _$RepoDetailStateCopyWithImpl<$Res, RepoDetailState>;
  @useResult
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class _$RepoDetailStateCopyWithImpl<$Res, $Val extends RepoDetailState>
    implements $RepoDetailStateCopyWith<$Res> {
  _$RepoDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_value.copyWith(
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$InitialImpl(
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl({this.hasStarredStatusChanged = false}) : super._();

  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.initial(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasStarredStatusChanged);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return initial(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return initial?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends RepoDetailState {
  const factory _Initial({final bool hasStarredStatusChanged}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  bool get hasStarredStatusChanged;

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$LoadInProgressImpl(
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl({this.hasStarredStatusChanged = false})
      : super._();

  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadInProgress(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasStarredStatusChanged);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      __$$LoadInProgressImplCopyWithImpl<_$LoadInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadInProgress(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadInProgress?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends RepoDetailState {
  const factory _LoadInProgress({final bool hasStarredStatusChanged}) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  bool get hasStarredStatusChanged;

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged});

  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoDetail = null,
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == repoDetail
          ? _value.repoDetail
          : repoDetail // ignore: cast_nullable_to_non_nullable
              as Fresh<GithubRepoDetail?>,
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail {
    return $FreshCopyWith<GithubRepoDetail?, $Res>(_value.repoDetail, (value) {
      return _then(_value.copyWith(repoDetail: value));
    });
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.repoDetail,
      {this.hasStarredStatusChanged = false})
      : super._();

  @override
  final Fresh<GithubRepoDetail?> repoDetail;
  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadSuccess(repoDetail: $repoDetail, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.repoDetail, repoDetail) ||
                other.repoDetail == repoDetail) &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, repoDetail, hasStarredStatusChanged);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadSuccess(repoDetail, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadSuccess?.call(repoDetail, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repoDetail, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends RepoDetailState {
  const factory _LoadSuccess(final Fresh<GithubRepoDetail?> repoDetail,
      {final bool hasStarredStatusChanged}) = _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  Fresh<GithubRepoDetail?> get repoDetail;
  @override
  bool get hasStarredStatusChanged;

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GithubFailure failure, bool hasStarredStatusChanged});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.failure, {this.hasStarredStatusChanged = false})
      : super._();

  @override
  final GithubFailure failure;
  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadFailure(failure: $failure, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, failure, hasStarredStatusChanged);

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadFailure(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadFailure?.call(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends RepoDetailState {
  const factory _LoadFailure(final GithubFailure failure,
      {final bool hasStarredStatusChanged}) = _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  GithubFailure get failure;
  @override
  bool get hasStarredStatusChanged;

  /// Create a copy of RepoDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
