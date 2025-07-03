import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/core/theme/theme.dart';

class ImagePreview extends StatelessWidget {
  final XFile image;
  final VoidCallback onRemove;

  /// minimum width and height
  final double minSize;

  final double maxHeight;
  final double maxWidth;

  const ImagePreview({
    super.key,
    required this.image,
    required this.onRemove,
    this.minSize = 80,
    this.maxHeight = 250,
    this.maxWidth = 300,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minSize,
        minHeight: minSize,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: AppRadii.allLg,
            child: Container(
              color: Colors.black12,
              alignment: Alignment.center,
              child: Image.file(File(image.path), fit: BoxFit.contain),
            ),
          ),
          Positioned(
            top: AppSpacing.sm,
            right: AppSpacing.sm,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha((255 * 0.6).floor()),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
