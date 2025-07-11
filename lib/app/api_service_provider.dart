import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/studio/data/studio_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pudge/core/api/api_service.dart';
import 'package:pudge/core/api/services/token_service/token_service_impl.dart';
import 'package:pudge/features/auth/data/auth_api.dart';
import 'package:pudge/features/profile/data/profile_api.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiService(Ref ref) {
  final api = ApiService(ref.watch(tokenServiceProvider));
  registerApis(api);
  return api;
}

void registerApis(ApiService api) {
  api.registerService(AuthApi());
  api.registerService(ProfileApi());
  api.registerService(StudioApi());
}
