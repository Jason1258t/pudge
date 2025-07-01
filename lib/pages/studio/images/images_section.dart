import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/pages/studio/images/selected_images_slider.dart';

import 'image_picker_widget.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({
    super.key,
    required this.images,
    required this.onImagesChanged,
    required this.pickImages,
  });

  final List<XFile> images;
  final ValueChanged<List<XFile>> onImagesChanged;
  final Function(BuildContext context) pickImages;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ImagePickerWidget(
        pickImages: pickImages,
      );
    } else {
      return SelectedImagesSlider(
        pickImages: pickImages,
        images: images,
        onImagesChanged: onImagesChanged,
      );
    }
  }
}
