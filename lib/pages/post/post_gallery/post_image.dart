import 'package:flutter/material.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/widgets/image.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.image, required this.onTap});

  final ImageData image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: image.aspectRatio,
        child: CustomNetworkImage(url: image.originalUrl, fit: BoxFit.contain),
      ),
    );
  }
}
