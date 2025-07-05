import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/pages/post/post_gallery/gallery_dots.dart';
import 'package:pudge/shared/ui/animations/shimmer.dart';
import 'package:shimmer/shimmer.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/post/${post.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          Gap(AppSpacing.xs),
          Row(
            children: [
              Expanded(
                child: Text(
                  post.title,
                  style: AppTypography.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: IconButton(
                  iconSize: 16,
                  onPressed: () {
                    log("Image actions clicked");
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.more_horiz, color: AppColors.onBackground),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _image() {
    final image = post.images.first;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: AppRadii.allLg,
          child: AspectRatio(
            aspectRatio: image.aspectRatio,
            child: CachedNetworkImage(
              imageUrl: image.originalUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  CustomShimmer(child: SizedBox.expand()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image),
            ),
          ),
        ),
        if (post.images.length > 1) ...[
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: GalleryDots(
              length: post.images.length,
              curr: 0,
              size: 6,
              padding: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ],
    );
  }
}
