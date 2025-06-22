import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pudge/core/theme/app_spacing.dart';

class ProfileImagesGrid extends StatelessWidget {
  const ProfileImagesGrid({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 3,
      childCount: images.length,
      mainAxisSpacing: AppSpacing.xs,
      crossAxisSpacing: AppSpacing.xs,
      itemBuilder: (context, index) {
        return Image.network(images[index]);
      },
    );
  }
}
