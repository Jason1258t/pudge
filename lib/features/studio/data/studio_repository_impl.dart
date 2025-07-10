import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/app/api_registery.dart';
import 'package:pudge/features/studio/data/studio_api.dart';
import 'package:pudge/features/studio/domain/studio_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
StudioRepository studioRepository(Ref ref) {
  return StudioRepositoryImpl(ref.watch(apiServiceProvider).getService());
}

class StudioRepositoryImpl implements StudioRepository {
  // ignore: unused_field
  final StudioApi _api;
  StudioRepositoryImpl(this._api);

  @override
  Future createPost(data) async {
    final form = FormData.fromMap({
      'title': data.title,
      'description': data.description,
      'images': data.images.map((image) =>
          MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          )).toList(),
    });

    await _api.create(form);
  }


}
