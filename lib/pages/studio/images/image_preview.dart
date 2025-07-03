import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/core/theme/theme.dart';

class ImagePreview extends StatelessWidget {
  final XFile image;
  final VoidCallback onRemove;

  late final BoxConstraints _constraints;

  ImagePreview({
    super.key,
    required this.image,
    required this.onRemove,
    BoxConstraints? constraints,
  }) {
    _constraints = BoxConstraints(
      minWidth: constraints?.minWidth ?? 80,
      minHeight: constraints?.minHeight ?? 80,
      maxHeight: constraints?.maxHeight ?? 250,
      maxWidth: constraints?.maxWidth ?? 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: _constraints,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: AppRadii.allLg,
            child: Container(
              color: AppColors.surfaceVariant,
              alignment: Alignment.center,
              child: Image.file(File(image.path), fit: BoxFit.contain),
            ),
          ),
          _closeButton(),
        ],
      ),
    );
  }

  _closeButton() {
    return Positioned(
      top: AppSpacing.sm,
      right: AppSpacing.sm,
      child: GestureDetector(
        onTap: onRemove,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.close, size: 16, color: Colors.white),
        ),
      ),
    );
  }
}
