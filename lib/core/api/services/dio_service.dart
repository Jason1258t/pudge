import 'package:dio/dio.dart';
import 'package:pudge/core/api/services/token_service/token_service.dart';

abstract interface class DioService {
  void initialize(Dio dio, {TokenService? tokenService});
}