import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/image/image.dart';

class PostWidget extends StatelessWidget {
  final String caption;
  final ImageData image;

  const PostWidget({super.key, required this.image, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppRadii.allLg,
          child: AspectRatio(
            aspectRatio: image.aspectRatio,
            child: CachedNetworkImage(
              imageUrl: image.originalUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image),
            ),
          ),
        ),
        Gap(AppSpacing.xs),
        Row(
          children: [
            Expanded(
              child: Text(
                caption,
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
    );
  }
}
