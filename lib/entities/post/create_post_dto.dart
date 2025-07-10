import 'package:image_picker/image_picker.dart';

class CreatePostDTO {
  final String title;
  final String description;
  final List<XFile> images;

  const CreatePostDTO({
    required this.title,
    required this.description,
    required this.images,
  });
}

