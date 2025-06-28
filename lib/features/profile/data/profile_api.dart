import 'package:dio/dio.dart';
import 'package:pudge/core/api/services/dio_service.dart';
import 'package:pudge/core/api/services/token_service/token_service.dart';

class ProfileApi implements DioService {
  late final Dio _dio;

  @override
  void initialize(Dio dio, {TokenService? tokenService}) {
    _dio = dio;
  }

  Future getCurrentUser() async {
    throw UnimplementedError();
  }

  Future getSavedPosts() async {
    throw UnimplementedError();
  }

  Future getCreatedPosts() async {
    throw UnimplementedError();
  }
}
