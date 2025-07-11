import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/shared/ui/indicators/dot_indicators.dart';
import 'package:pudge/widgets/image.dart';

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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: AppRadii.allLg,
          child: AspectRatio(
            aspectRatio: post.cover.aspectRatio,
            child: CustomNetworkImage(
              url: post.cover.originalUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (post.images.length > 1) ...[
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: DotIndicators(
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
