import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pudge/core/api/services/dio_service.dart';
import 'package:pudge/core/api/services/token_service/token_service.dart';

class AuthApi implements DioService {
  late final Dio _dio;
  late final TokenService _tokenService;

  @override
  void initialize(Dio dio, {TokenService? tokenService}) {
    _dio = dio;
    _tokenService = tokenService!;
  }

  Future<void> auth(String token) async {
    final res = await _dio.post('auth/', data: {'token': token});
    if (res.statusCode == 200) {
      final authToken = res.data;
      _tokenService.saveTokens(authToken);
    } else {
      log('Error during authorization');
    }
  }
}
