import 'package:image_picker/image_picker.dart';
import 'package:pudge/features/studio/presentation/studio_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'studio_notifier.g.dart';

@riverpod
class StudioNotifier extends _$StudioNotifier {
  @override
  StudioState build() => StudioState(title: '', description: '', images: []);

  void onTitleChanged(String? value) {
    state = state.copyWith(title: value ?? '');
  }

  void onDescriptionChanged(String? value) {
    state = state.copyWith(description: value ?? '');
  }

  void setImages(List<XFile> images) {
    state = state.copyWith(images: images);
  }

  Future create() async {
    state = state.copyWith(loading: true);
  }
}
