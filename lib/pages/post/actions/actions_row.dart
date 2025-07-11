import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/core/utils/assets.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/shared/ui/icon/icon.dart';

import 'share_bottom_sheet.dart';
import 'post_actions_bottom_sheet.dart';

class PostActionsRow extends StatelessWidget {
  const PostActionsRow({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon.icon(
          post.isLiked ? Icons.favorite : Icons.favorite_border,
          color: post.isLiked ? AppColors.red : AppColors.onBackground,
        ),
        Gap(AppSpacing.sm),
        Text(post.likesCount.toString(), style: AppTypography.bodyRegular),
        Gap(AppSpacing.md),
        CustomIcon.asset(
          Assets.icon('comments.svg'),
          color: AppColors.onBackground,
        ),
        Gap(AppSpacing.sm),
        Text(post.commentsCount.toString(), style: AppTypography.bodyRegular),
        Gap(AppSpacing.md),
        GestureDetector(
          onTap: () => _showBottomSheet(ShareBottomSheet(post: post), context),
          child: CustomIcon.icon(
            Icons.share_outlined,
            color: AppColors.onBackground,
          ),
        ),
        Gap(AppSpacing.md),
        GestureDetector(
          onTap: () => _showBottomSheet(
            PostActionsBottomSheet(post: post),
            context,
            showDragHandle: false,
          ),
          child: CustomIcon.icon(
            Icons.more_horiz,
            color: AppColors.onBackground,
          ),
        ),

        const Spacer(),
        SizedBox(
          width: 100,
          height: 36,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              padding: EdgeInsets.all(4),
              shape: RoundedRectangleBorder(borderRadius: AppRadii.allLg),
            ),
            child: Text('Save', style: AppTypography.buttonLabel),
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(
    Widget child,
    BuildContext context, {
    bool showDragHandle = true,
  }) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: showDragHandle,
    backgroundColor: AppColors.background,
    builder: (_) => child,
  );
}
