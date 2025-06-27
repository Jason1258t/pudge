import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/api/api_service.dart';
import 'package:pudge/core/api/services/token_service/token_service_impl.dart';
import 'package:pudge/features/auth/data/auth_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_registery.g.dart';

@riverpod
ApiService apiService(Ref ref) {
  final api = ApiService(ref.watch(tokenServiceProvider));
  registerApis(api);
  return api;
}

void registerApis(ApiService api) {
  api.registerService(AuthApi());
}
