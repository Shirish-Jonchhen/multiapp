// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokenStateImpl _$$AuthTokenStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokenStateImpl(
      authStatus:
          $enumDecodeNullable(_$AuthStatusEnumMap, json['authStatus']) ??
              AuthStatus.initial,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$AuthTokenStateImplToJson(
        _$AuthTokenStateImpl instance) =>
    <String, dynamic>{
      'authStatus': _$AuthStatusEnumMap[instance.authStatus]!,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'errorMessage': instance.errorMessage,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.initial: 'initial',
  AuthStatus.authenticated: 'authenticated',
  AuthStatus.unauthenticated: 'unauthenticated',
};
