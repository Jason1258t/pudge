import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/icon/icon.dart';
import 'package:pudge/shared/utils/test_models.dart';
import 'package:pudge/widgets/comment.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  static final comments = TestModels.comments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("Comments", style: AppTypography.titleLarge),
            ),
            Gap(AppSpacing.lg),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, ind) => CommentWidget(comment: comments[ind]),
                itemCount: comments.length,
              ),
            ),
            TextField(
              cursorColor: AppColors.onBackground,
              minLines: 1,
              maxLines: 4,
              style: AppTypography.bodyRegular,
              decoration: InputDecoration(
                hintText: 'Start typing your comment here',
                hintStyle: AppTypography.inputHint,
                suffixIcon: CustomIcon.icon(Icons.image_outlined, color: AppColors.textHint,),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textHint),
                    borderRadius: AppRadii.allXl
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.onBackground),
                    borderRadius: AppRadii.allXl
                ),
              ),
            ),
            Gap(AppSpacing.xl)
          ],
        ),
      ),
    );
  }
}
