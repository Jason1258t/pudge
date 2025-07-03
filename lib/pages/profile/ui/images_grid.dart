import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/core/theme/app_spacing.dart';
import 'package:pudge/entities/image/image.dart';

class ProfileImagesGrid extends StatelessWidget {
  const ProfileImagesGrid({super.key, required this.images});

  final List<ImageData> images;

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 3,
      childCount: images.length,
      mainAxisSpacing: AppSpacing.xs,
      crossAxisSpacing: AppSpacing.xs,
      itemBuilder: (context, index) {
        final img = images[index];
        return ClipRRect(
          borderRadius: AppRadii.allMd,
          child: AspectRatio(
            aspectRatio: img.aspectRatio,
            child: CachedNetworkImage(
              imageUrl: img.originalUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),              errorWidget: (context, url, error) =>
            const Icon(Icons.broken_image),
            ),          ),        );      },    );  }}