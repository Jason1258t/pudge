import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pudge/entities/image/image.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.image});

  final ImageData image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: image.aspectRatio,
      child: CachedNetworkImage(
        imageUrl: image.originalUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget: (context, url, error) =>
            const Icon(Icons.broken_image),
      ),
    );
  }
}
