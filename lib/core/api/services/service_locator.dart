import 'package:pudge/core/api/services/dio_service.dart';

class ApiServiceLocator {
  final Map<Type, dynamic> _services = {};

  void registerService<T extends DioService>(T newService) {
    if (_services.containsKey(T)) throw Exception("Service already exist");
    _services[T] = newService;
  }

  T getService<T extends DioService>() {
    if (_services.containsKey(T)) return _services[T];
    throw Exception("Service doesn\'t exist");
  }
}
