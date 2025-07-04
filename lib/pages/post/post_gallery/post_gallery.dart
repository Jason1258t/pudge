import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pudge/core/theme/colors.dart';
import 'package:pudge/entities/image/image.dart';

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
            itemBuilder: (context, index) =>
                PostImage(image: widget.images[index]),
            itemCount: widget.images.length,
          ),
        ),
        if (widget.images.length > 1) ...[
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black54,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildDots(),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  _buildDots() {
    return List.generate(
      widget.images.length,
      (index) => Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: idx == index ? AppColors.primary : Colors.white30,
        ),
      ),
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
