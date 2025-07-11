import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/core/utils/utils.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/pages/post/actions/row_text_button.dart';
import 'package:pudge/widgets/image.dart';

class PostActionsBottomSheet extends StatelessWidget {
  const PostActionsBottomSheet({super.key, required this.post});

  final Post post;
  static const double coverSize = 100;
  static const double coverExtent = 0.6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(
                  coverSize * (1 - coverExtent) + AppSpacing.md,
                  crossAxisExtent: double.infinity,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Text(
                    "Here are a few more actions you can take with this post",
                    style: AppTypography.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(AppSpacing.lg),
                RowTextButton(
                  text: "Copy link",
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_outlined,
                    size: 24,
                    color: AppColors.onBackground,
                  ),
                ),
                Gap(AppSpacing.md),
                RowTextButton(
                  text: "Hide post",
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.icon('eye-slash.svg'),
                    width: 24,
                    colorFilter: svgColor(AppColors.onBackground),
                  ),
                ),
                Gap(AppSpacing.md),
                RowTextButton(
                  text: "Download image",
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.icon('download.svg'),
                    width: 24,
                    colorFilter: svgColor(AppColors.onBackground),
                  ),
                ),
                Gap(AppSpacing.md),
                RowTextButton(
                  text: "Report this post",
                  onPressed: () {},
                  description: "If this post contains harmful, offensive or inappropriate content",
                  icon: SvgPicture.asset(
                    Assets.icon('flag.svg'),
                    width: 24,
                    colorFilter: svgColor(AppColors.onBackground),
                  ),
                ),
                Gap(AppSpacing.xxl),
              ],
            ),
          ),
          _buildCover(),
          _buildCloseButton(context),
        ],
      ),
    );
  }

  _buildCloseButton(BuildContext context) {
    return Positioned(
      right: 8,
      top: 8,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadii.allMd,
          onTap: () {
            log("close");
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 40,
            width: 40,
            child: Center(
              child: Icon(Icons.close, size: 32, color: AppColors.onBackground),
            ),
          ),
        ),
      ),
    );
  }

  _buildCover() {
    return Positioned(
      left: 0,
      right: 0,
      top: -(coverSize * coverExtent),
      child: Center(
        child: IgnorePointer(
          child: Container(
            width: coverSize,
            height: coverSize,
            decoration: BoxDecoration(borderRadius: AppRadii.allLg),
            clipBehavior: Clip.hardEdge,
            child: CustomNetworkImage(
              url: post.cover.originalUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
