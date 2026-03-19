import 'package:dio/dio.dart';
import 'package:multiapp/core/bloc/auth_token_cubit.dart';

class TokenInterceptor extends Interceptor {
  final AuthTokenCubit authTokenCubit;
  final Dio dio;

  TokenInterceptor({required this.authTokenCubit, required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = authTokenCubit.state.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Skip interceptor for refresh token requests
      if (err.requestOptions.extra['skipInterceptor'] == true) {
        handler.next(err);
        return;
      }
      try {
        final newToken = await _refreshToken();
        authTokenCubit.updateTokens(
          accessToken: newToken.accessToken,
          refreshToken: newToken.refreshToken,
        );
        // Retry with new token
        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer ${newToken.accessToken}';
        final response = await dio.fetch(opts);
        handler.resolve(response);
        return;
      } catch (_) {
        authTokenCubit.logout();
      }
    }
    handler.next(err);
  }

  Future<({String accessToken, String refreshToken})> _refreshToken() async {
    final refreshToken = authTokenCubit.state.refreshToken;
    // In a real app: POST /auth/refresh with refreshToken
    // For now, simulate with a dummy endpoint call structure:
    final response = await dio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
      options: Options(extra: {'skipInterceptor': true}),
    );
    return (
      accessToken: response.data['accessToken'] as String,
      refreshToken: response.data['refreshToken'] as String,
    );
  }
}
