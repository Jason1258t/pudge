import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/pages/explore/post_overlay/post_overlay.dart';
import 'package:pudge/shared/ui/indicators/dot_indicators.dart';
import 'package:pudge/widgets/image.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late OverlayEntry _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (d) {
        _showOverlay(context, d);
      },
      onLongPressEnd: (details) async {
        _removeOverlay();
      },
      onLongPressCancel: () {
        if (_overlayEntry.mounted) _removeOverlay();
      },
      onTap: () {
        if (_overlayEntry.mounted) return;
        context.push('/post/${widget.post.id}');
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
                  widget.post.title,
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

  void _removeOverlay() => _overlayEntry.remove();

  void _showOverlay(BuildContext context, LongPressDownDetails details) {
    final overlay = Overlay.of(context);
    final offset = _getImagePosition();
    final size = _getPostSize();

    _overlayEntry = OverlayEntry(
      builder: (context) => PostOverlay(
        image: _image(),
        size: size,
        globalPosition: details.globalPosition,
        imageOffset: offset,
      ),
    );

    overlay.insert(_overlayEntry);
  }

  Offset _getImagePosition() {
    final renderBox = context.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  Size _getPostSize() {
    final renderBox = context.findRenderObject() as RenderBox;
    return renderBox.size;
  }

  _image() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: AppRadii.allLg,
          child: AspectRatio(
            aspectRatio: widget.post.cover.aspectRatio,
            child: CustomNetworkImage(
              url: widget.post.cover.originalUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (widget.post.images.length > 1) ...[
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: DotIndicators(
              length: widget.post.images.length,
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
