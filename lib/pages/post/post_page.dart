import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/core/theme/colors.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/pages/post/post_gallery/post_gallery.dart';
import 'package:pudge/pages/post/post_gallery/post_image.dart';
import 'package:pudge/shared/ui/buttons/back_button.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/test_models.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key, required this.postId}) {
    post = TestModels.posts.firstWhere((e) => e.id == postId);
  }

  final String postId;

  late final Post post;

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.paddingOf(context);

    final maxImageHeight = MediaQuery.sizeOf(context).height * 0.6;

    return CustomScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(width: double.infinity),
                PostGallery(
                  images: post.images,
                  constraints: BoxConstraints(
                    maxHeight: maxImageHeight,
                    minHeight: 100,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: insets.top,
            left: 20,
            child: CustomOverlayBackButton(),
          ),
        ],
      ),
    );
  }
}
