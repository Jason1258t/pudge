import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pudge/shared/utils/test_models.dart';

import 'post_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  final images = TestModels.images;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.symmetric(horizontal: 8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: AppColors.onBackground),
            ),
          ),
          child: Text(
            "For you",
            style: AppTypography.titleLarge.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
      body: MasonryGridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        itemBuilder: (_, i) => PostWidget(image: images[i], caption: 'Caption'),
        itemCount: images.length,
        mainAxisSpacing: AppSpacing.xs,
        crossAxisSpacing: AppSpacing.sm,
      ),
    );
  }
}
