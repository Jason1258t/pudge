import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/image/image.dart';

class NetworkImageWithCaption extends StatefulWidget {
  final String caption;
  final ImageData image;

  const NetworkImageWithCaption({
    super.key,
    required this.image,
    required this.caption,
  });

  @override
  State<NetworkImageWithCaption> createState() =>
      _NetworkImageWithCaptionState();
}

class _NetworkImageWithCaptionState extends State<NetworkImageWithCaption> {
  double? _aspectRatio;

  @override
  void initState() {
    _resolveAspectRatio(widget.image.originalUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('building ${_aspectRatio != null ? "cached image" : "image"}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppRadii.allLg,
          child: _aspectRatio == null
              ? Image.network(widget.image.originalUrl)
              : AspectRatio(
                  aspectRatio: _aspectRatio!,
                  child: CachedNetworkImage(
                    imageUrl: widget.image.originalUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
        ),
        Text(widget.caption, style: AppTypography.bodySmall),
      ],
    );
  }

  void _resolveAspectRatio(String url) {
    final provider = NetworkImage(url);
    final stream = provider.resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener((info, _) {
        final aspectRatio = info.image.width / info.image.height;
        log(
          "Image(\n\tid: '', \n\turl: '$url', \n\twidth: ${info.image.width}\n\theight: ${info.image.height}\n)",
        );

        if (mounted) setState(() => _aspectRatio = aspectRatio);
      }),
    );
  }
}
