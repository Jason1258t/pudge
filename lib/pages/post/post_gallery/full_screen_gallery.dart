import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/pages/post/post_gallery/gallery_dots.dart';
import 'package:pudge/shared/ui/buttons/back_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PhotoViewGallery.builder(
              onPageChanged: (page) => setState(() {
                currPage = page;
              }),
              itemCount: widget.images.length,
              builder: (_, idx) => PhotoViewGalleryPageOptions.customChild(
                minScale: 0.5,
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
            top: MediaQuery.paddingOf(context).top,
            left: 20,
            child: CustomOverlayBackButton(),
          ),

          Positioned(
            bottom: MediaQuery.paddingOf(context).bottom + 20,
            left: 0,
            right: 0,
            child: GalleryDots(length: widget.images.length, curr: currPage),
          ),
        ],
      ),
    );
  }
}
