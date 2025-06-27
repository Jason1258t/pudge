import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/api/services/dio_service.dart';
import 'package:pudge/core/api/services/service_locator.dart';
import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'services/token_service/token_service.dart';
import 'services/token_service/token_service_impl.dart';

part 'api_service.g.dart';

part 'options.dart';

part 'services/interceptor.dart';

@riverpod
ApiService apeService(Ref ref) {
  return ApiService(ref.watch(tokenServiceProvider));
}

class ApiService {
  final _dio = Dio();
  final TokenService _tokenService;
  final _services = ApiServiceLocator();

  void registerService<T extends DioService>(T newService) {
    _services.registerService(newService);
    newService.initialize(_dio, tokenService: _tokenService);
  }

  T getService<T extends DioService>() => _services.getService<T>();

  ApiService(this._tokenService) {
    final interceptor = DioInterceptor(_tokenService);
    _dio.options = baseOptions;
    _dio.interceptors.add(interceptor);
  }
}
