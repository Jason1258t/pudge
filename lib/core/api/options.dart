part of 'api_service.dart';

final baseOptions = BaseOptions(
  baseUrl: 'https://your-api.com/api/v1',
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
  headers: const {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);
