import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_token_state.freezed.dart';
part 'auth_token_state.g.dart';

enum AuthStatus { initial, authenticated, unauthenticated }

@freezed
class AuthTokenState with _$AuthTokenState {
  const AuthTokenState._();

  const factory AuthTokenState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    String? accessToken,
    String? refreshToken,
    String? errorMessage,
  }) = _AuthTokenState;

  factory AuthTokenState.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenStateFromJson(json);

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
