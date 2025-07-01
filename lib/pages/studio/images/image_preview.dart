import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/core/theme/theme.dart';

class ImagePreview extends StatelessWidget {
  final XFile image;
  final VoidCallback onRemove;

  const ImagePreview({super.key,
    required this.image,
    required this.onRemove,
  });

  static const double minSize = 80;
  static const double maxSize = 220;
  static const double maxWidth = 300;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: minSize,
        minHeight: minSize,
        maxWidth: maxWidth,
        maxHeight: maxSize,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: AppRadii.allLg,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black12,
              alignment: Alignment.center,
              child: Image.file(
                File(image.path),
                fit: BoxFit.contain, // сохраняем пропорции
                width: double.infinity,
                height: double.infinity,
              ),
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
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
