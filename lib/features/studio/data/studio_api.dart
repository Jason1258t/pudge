import 'package:dio/dio.dart';
import 'package:pudge/core/api/services/dio_service.dart';
import 'package:pudge/core/api/services/token_service/token_service.dart';


class StudioApi implements DioService {
  // ignore: unused_field
  late final Dio _dio;

  @override
  void initialize(Dio dio, {TokenService? tokenService}) {
    _dio = dio;
  }

  Future create(FormData data) async {
    throw UnimplementedError();
  }
}