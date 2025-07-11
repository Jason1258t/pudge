import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/widgets/image.dart';
import 'package:share_plus/share_plus.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: double.infinity,
      // height: height * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(AppSpacing.md),
            Text(
              "Share link to this post",
              style: AppTypography.titleMedium.copyWith(fontSize: 22),
            ),
            Gap(AppSpacing.lg),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * 0.4),
              child: ClipRRect(
                borderRadius: AppRadii.allLg,
                child: CustomNetworkImage(url: post.cover.originalUrl),
              ),
            ),
            Gap(AppSpacing.xxl),
            CustomElevatedButton(
              callback: () {
                SharePlus.instance.share(
                  ShareParams(
                    text: 'check out my website https://ru.pinterest.com',
                  ),
                );
              },
              text: "Share",
            ),
            Gap(100),
          ],
        ),
      ),
    );
  }
}
