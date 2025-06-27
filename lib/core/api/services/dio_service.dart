import 'package:dio/dio.dart';

abstract interface class DioService {
  void initialize(Dio dio);
}