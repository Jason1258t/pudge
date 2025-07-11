import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/pages/explore/post_widget.dart';
import 'package:pudge/pages/post/actions/actions_row.dart';
import 'package:pudge/shared/ui/buttons/back_button.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/test_models.dart';
import 'package:pudge/widgets/post_gallery/post_gallery.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key, required this.postId}) {
    post = TestModels.posts.firstWhere((e) => e.id == postId);
  }

  final String postId;

  late final Post post;
  final samePosts = TestModels.posts;

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.paddingOf(context);
    final padding = EdgeInsets.symmetric(horizontal: 12);
    final maxImageHeight = MediaQuery.sizeOf(context).height * 0.6;

    return CustomScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: PostGallery(
                    images: post.images,
                    constraints: BoxConstraints(
                      maxHeight: maxImageHeight,
                      minHeight: 100,
                    ),
                  ),
                ),
                SliverGap(AppSpacing.md),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: padding,
                    child: Text(
                      post.title,
                      style: AppTypography.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SliverGap(AppSpacing.sm),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: padding,
                    child: PostActionsRow(post: post),
                  ),
                ),
                SliverGap(AppSpacing.md),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[700],
                  ),
                ),
                SliverGap(AppSpacing.md),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: padding,
                    child: Text(
                      "Related posts",
                      style: AppTypography.bodyLarge,
                    ),
                  ),
                ),
                SliverGap(AppSpacing.sm),
                SliverPadding(
                  padding: padding,
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    itemBuilder: (_, index) =>
                        PostWidget(post: samePosts[index]),
                    childCount: samePosts.length,
                    crossAxisSpacing: AppSpacing.sm,
                    mainAxisSpacing: AppSpacing.xs,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: insets.top + AppSpacing.sm,
            left: 20,
            child: CustomOverlayBackButton(),
          ),
        ],
      ),
    );
  }
}
