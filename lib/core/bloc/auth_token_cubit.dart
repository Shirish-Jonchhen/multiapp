import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'auth_token_state.dart';

@singleton
class AuthTokenCubit extends Cubit<AuthTokenState> {
  AuthTokenCubit() : super(const AuthTokenState());

  void updateTokens(
      {required String accessToken, required String refreshToken}) {
    emit(state.copyWith(
      authStatus: AuthStatus.authenticated,
      accessToken: accessToken,
      refreshToken: refreshToken,
    ));
  }

  void logout() {
    emit(const AuthTokenState(authStatus: AuthStatus.unauthenticated));
  }
}
