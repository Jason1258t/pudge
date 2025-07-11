import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pudge/core/theme/app_spacing.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/shared/ui/buttons/back_button.dart';
import 'package:pudge/shared/ui/indicators/dot_indicators.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenGallery extends StatefulWidget {
  const FullScreenGallery({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  final int initialIndex;
  final List<ImageData> images;

  @override
  State<FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<FullScreenGallery> {
  int currPage = 0;

  late final PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialIndex);
    currPage = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PhotoViewGallery.builder(
              pageController: controller,
              onPageChanged: (page) => setState(() {
                currPage = page;
              }),
              itemCount: widget.images.length,
              builder: (_, idx) => PhotoViewGalleryPageOptions.customChild(
                minScale: 0.8,
                maxScale: PhotoViewComputedScale.contained * 3,
                basePosition: Alignment(0, -0.3),
                child: CachedNetworkImage(
                  imageUrl: widget.images[idx].originalUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + AppSpacing.sm,
            left: 20,
            child: CustomOverlayBackButton(),
          ),

          if (widget.images.length > 1) ...[
            Positioned(
              bottom: MediaQuery.paddingOf(context).bottom + 20,
              left: 0,
              right: 0,
              child: DotIndicators(length: widget.images.length, curr: currPage),
            ),
          ],
        ],
      ),
    );
  }
}
