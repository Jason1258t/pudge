import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/app_spacing.dart';
import 'package:pudge/core/theme/colors.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/core/utils/assets.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/pages/post/actions_row.dart';
import 'package:pudge/pages/post/post_gallery/post_gallery.dart';
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
            child: SingleChildScrollView(
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
                  Gap(AppSpacing.md),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            post.title,
                            style: AppTypography.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSpacing.md),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: PostActionsRow(post: post),
                  ),
                  Gap(AppSpacing.lg),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[700],
                  ),
                  Gap(AppSpacing.lg),
                ],
              ),
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
