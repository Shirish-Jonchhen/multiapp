// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthTokenState _$AuthTokenStateFromJson(Map<String, dynamic> json) {
  return _AuthTokenState.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenState {
  AuthStatus get authStatus => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this AuthTokenState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokenStateCopyWith<AuthTokenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenStateCopyWith<$Res> {
  factory $AuthTokenStateCopyWith(
          AuthTokenState value, $Res Function(AuthTokenState) then) =
      _$AuthTokenStateCopyWithImpl<$Res, AuthTokenState>;
  @useResult
  $Res call(
      {AuthStatus authStatus,
      String? accessToken,
      String? refreshToken,
      String? errorMessage});
}

/// @nodoc
class _$AuthTokenStateCopyWithImpl<$Res, $Val extends AuthTokenState>
    implements $AuthTokenStateCopyWith<$Res> {
  _$AuthTokenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthTokenStateImplCopyWith<$Res>
    implements $AuthTokenStateCopyWith<$Res> {
  factory _$$AuthTokenStateImplCopyWith(_$AuthTokenStateImpl value,
          $Res Function(_$AuthTokenStateImpl) then) =
      __$$AuthTokenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus authStatus,
      String? accessToken,
      String? refreshToken,
      String? errorMessage});
}

/// @nodoc
class __$$AuthTokenStateImplCopyWithImpl<$Res>
    extends _$AuthTokenStateCopyWithImpl<$Res, _$AuthTokenStateImpl>
    implements _$$AuthTokenStateImplCopyWith<$Res> {
  __$$AuthTokenStateImplCopyWithImpl(
      _$AuthTokenStateImpl _value, $Res Function(_$AuthTokenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthTokenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthTokenStateImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenStateImpl extends _AuthTokenState {
  const _$AuthTokenStateImpl(
      {this.authStatus = AuthStatus.initial,
      this.accessToken,
      this.refreshToken,
      this.errorMessage})
      : super._();

  factory _$AuthTokenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenStateImplFromJson(json);

  @override
  @JsonKey()
  final AuthStatus authStatus;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthTokenState(authStatus: $authStatus, accessToken: $accessToken, refreshToken: $refreshToken, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenStateImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, authStatus, accessToken, refreshToken, errorMessage);

  /// Create a copy of AuthTokenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenStateImplCopyWith<_$AuthTokenStateImpl> get copyWith =>
      __$$AuthTokenStateImplCopyWithImpl<_$AuthTokenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenStateImplToJson(
      this,
    );
  }
}

abstract class _AuthTokenState extends AuthTokenState {
  const factory _AuthTokenState(
      {final AuthStatus authStatus,
      final String? accessToken,
      final String? refreshToken,
      final String? errorMessage}) = _$AuthTokenStateImpl;
  const _AuthTokenState._() : super._();

  factory _AuthTokenState.fromJson(Map<String, dynamic> json) =
      _$AuthTokenStateImpl.fromJson;

  @override
  AuthStatus get authStatus;
  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  String? get errorMessage;

  /// Create a copy of AuthTokenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokenStateImplCopyWith<_$AuthTokenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
