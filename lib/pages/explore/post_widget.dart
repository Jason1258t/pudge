import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/features/post_overlay/button_data.dart';
import 'package:pudge/features/post_overlay/post_overlay_notifier.dart';
import 'package:pudge/features/post_overlay/post_overlay_state.dart';
import 'package:pudge/pages/explore/post_overlay/post_overlay.dart';
import 'package:pudge/shared/ui/indicators/dot_indicators.dart';
import 'package:pudge/widgets/image.dart';

class PostWidget extends ConsumerWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  static final overlayButtons = <ButtonData>[
    ButtonData(
      position: null,
      id: 'bookmark',
      callback: () {
        log("bookmark pressed");
      },
      icon: Icons.bookmark_add_outlined,
    ),
    ButtonData(
      position: null,
      id: 'share',
      callback: () {
        log("share pressed");
      },
      icon: Icons.share_outlined,
    ),
    ButtonData(
      position: null,
      id: 'telegram',
      callback: () {
        log("telegram pressed");
      },
      icon: Icons.telegram,
    ),
    ButtonData(
      position: null,
      id: 'favorite',
      callback: () {
        log("favorite pressed");
      },
      icon: Icons.favorite_border_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(postOverlayStateNotifierProvider.notifier);
    final state = ref.watch(postOverlayStateNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPressStart: (d) {
            _showOverlay(context, d, notifier);
          },
          onLongPressEnd: (details) async {
            if (state.hoveredButtonIndex != null) {
              state.hoveredButton.callback();
            }
            _removeOverlay(notifier);
          },
          onLongPressMoveUpdate: state.onPointerMove,
          onTap: () {
            if (state.overlayEntry?.mounted ?? false) return;
            context.push('/post/${post.id}');
          },
          child: _image(),
        ),
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

  void _showOverlay(
    BuildContext context,
    LongPressStartDetails details,
    PostOverlayStateNotifier notifier,
  ) {
    final overlay = Overlay.of(context);
    final offset = _getImagePosition(context);
    final size = _getPostSize(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => PostOverlay(
        image: _image(),
        buttons: overlayButtons,
        size: size,
        center: details.globalPosition,
        imageOffset: offset,
      ),
    );

    notifier.setOverlay(overlayEntry);

    overlay.insert(overlayEntry);
    HapticFeedback.mediumImpact();
  }

  void _removeOverlay(PostOverlayStateNotifier notifier) {
    notifier.dispose();
  }

  Offset _getImagePosition(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  Size _getPostSize(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    return renderBox.size;
  }
}
