import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'add_more_button.dart';
import 'image_preview.dart';

class SelectedImagesSlider extends StatefulWidget {
  final List<XFile> images;
  final ValueChanged<List<XFile>> onImagesChanged;
  final Function(BuildContext context) pickImages;



  const SelectedImagesSlider({
    super.key,
    required this.images,
    required this.onImagesChanged,
    required this.pickImages,
  });

  @override
  State<SelectedImagesSlider> createState() => _SelectedImagesWidgetState();
}

class _SelectedImagesWidgetState extends State<SelectedImagesSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final images = widget.images;

    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length + 1,
        itemBuilder: (context, index) {
          if (index == images.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AddMoreButton(onPressed: () => widget.pickImages(context)),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImagePreview(
              image: images[index],
              onRemove: () => _removeImage(index),
            ),
          );
        },
      ),
    );
  }

  void _removeImage(int index) {
    final newImages = List<XFile>.from(widget.images)..removeAt(index);
    widget.onImagesChanged(newImages);
  }
}
