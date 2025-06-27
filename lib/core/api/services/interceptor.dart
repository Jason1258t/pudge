part of '../api_service.dart';

class DioInterceptor extends Interceptor {
  final TokenService _tokenService;

  DioInterceptor(this._tokenService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.headers.containsKey('Authorization')) {
      final token = await _tokenService.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NotAuthorizedException(),
          type: DioExceptionType.unknown,
        ),
      );
    } else {
      handler.next(err);
    }
  }
}
