import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/core/utils/assets.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/widgets/image.dart';
import 'package:share_plus/share_plus.dart';

class PostActionsRow extends StatelessWidget {
  const PostActionsRow({super.key, required this.post});

  final Post post;

  void showShareBottomSheet(context) {
    final height = MediaQuery.sizeOf(context).height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.background,
      builder: (_) => SizedBox(
        width: double.infinity,
        // height: height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(AppSpacing.md),
              Text("Share link to this post", style: AppTypography.titleMedium.copyWith(fontSize: 22)),
              Gap(AppSpacing.lg),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: height * 0.4),
                child: ClipRRect(
                  borderRadius: AppRadii.allLg,
                  child: CustomNetworkImage(url: post.cover.originalUrl),
                ),
              ),
              Gap(AppSpacing.xxl),
              CustomElevatedButton(callback: () {
                SharePlus.instance.share(
                    ShareParams(text: 'check out my website https://ru.pinterest.com')
                );
              }, text: "Share"),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }

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
        GestureDetector(
          onTap: () => showShareBottomSheet(context),
          child: Icon(
            Icons.share_outlined,
            size: 24,
            color: AppColors.onBackground,
          ),
        ),
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
