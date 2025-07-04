import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/core/utils/assets.dart';
import 'package:pudge/entities/post/post.dart';

class PostActionsRow extends StatelessWidget {
  const PostActionsRow({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          post.isLiked ? Icons.favorite : Icons.favorite_border,
          size: 24,
          color: post.isLiked ? AppColors.red : AppColors.onBackground,
        ),
        Gap(AppSpacing.sm),
        Text(post.likesCount.toString(), style: AppTypography.bodyRegular),
        Gap(AppSpacing.md),
        SvgPicture.asset(
          Assets.icon('comments.svg'),
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            AppColors.onBackground,
            BlendMode.srcIn,
          ),
        ),
        Gap(AppSpacing.sm),
        Text(post.commentsCount.toString(), style: AppTypography.bodyRegular),
        Gap(AppSpacing.md),
        Icon(Icons.share_outlined, size: 24, color: AppColors.onBackground),
        Gap(AppSpacing.md),
        Icon(Icons.more_horiz, size: 24, color: AppColors.onBackground),

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
}
