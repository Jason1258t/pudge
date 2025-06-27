import 'package:dio/dio.dart';
import 'package:pudge/core/api/services/dio_service.dart';
import 'package:pudge/core/api/services/service_locator.dart';
import 'package:pudge/core/exceptions/auth_exceptions.dart';

import 'services/token_service/token_service.dart';

part 'options.dart';

part 'services/interceptor.dart';

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
