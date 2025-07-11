import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pudge/core/theme/colors.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/shared/ui/indicators/dot_indicators.dart';

import 'full_screen_gallery.dart';
import 'post_image.dart';

class PostGallery extends StatefulWidget {
  const PostGallery({
    super.key,
    required this.images,
    required this.constraints,
  });

  final List<ImageData> images;
  final BoxConstraints constraints;

  @override
  State<PostGallery> createState() => _PostGalleryState();
}

class _PostGalleryState extends State<PostGallery> {
  int idx = 0;

  final controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        idx = (controller.page ?? 0).round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: _getMaxHeight(context, widget.images),
          color: AppColors.surfaceVariant,
          constraints: widget.constraints,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) => PostImage(
              image: widget.images[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenGallery(
                      images: widget.images,
                      initialIndex: index,
                    ),
                  ),
                );
              },
            ),
            itemCount: widget.images.length,
          ),
        ),
        if (widget.images.length > 1) ...[
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: DotIndicators(length: widget.images.length, curr: idx),
          ),
        ],
      ],
    );
  }

  

  static double _getMaxHeight(BuildContext context, List<ImageData> images) {
    final heights = images
        .map((e) => MediaQuery.sizeOf(context).width / e.aspectRatio)
        .toList();
    final maxValue = heights.reduce((a, b) => max(a, b));
    return maxValue;
  }
}
