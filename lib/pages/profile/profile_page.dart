import 'package:flutter/material.dart' hide Image;
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/features/profile/presentation/profile_notifier/user_notifier.dart';
import 'package:pudge/pages/profile/ui/images_grid.dart';
import 'package:pudge/pages/profile/ui/profile_tabs.dart';
import 'package:pudge/pages/profile/ui/user_info/user_info.dart';
import 'package:pudge/shared/ui/animations/circular_progress_indicator.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/test_models.dart';

import '../../features/profile/presentation/profile_notifier/posts_notifier.dart';
import 'model/profile_tabs.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  ProfilePostsTypeEnum _currentPage = ProfilePostsTypeEnum.saved;

  void selectPage(ProfilePostsTypeEnum page) {
    setState(() {
      _currentPage = page;
    });
  }

  final images = TestModels.images;

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(currentProfileNotifierProvider);

    return CustomScaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // userData.when(
          //   data: (data) => UserInfo(data!),          //   error: (e, st) => SliverToBoxAdapter(child: ErrorWidget(e)),          //   loading: () =>          //       SliverToBoxAdapter(child: CustomCircularProgressIndicator()),          // ),          UserInfo(TestModels.user),
          SliverGap(AppSpacing.lg),
          ProfileTabs(selected: _currentPage, onSelect: selectPage),
          SliverGap(AppSpacing.lg),
          ProfileImagesGrid(images: images),
        ],
      ),
    );
  }

  buildImages() {
    final AsyncValue<List<Post>> postsProvider;
    final repo = ref.watch(currentPostsNotifierProvider);
    if (_currentPage == ProfilePostsTypeEnum.saved) {
      postsProvider = repo.savedPosts;
    } else {
      postsProvider = repo.createdPosts;
    }
    return postsProvider.when(
      data: (data) =>
          ProfileImagesGrid(images: data.map((e) => e.images.first).toList()),
      error: (e, st) => SliverToBoxAdapter(child: ErrorWidget(e)),
      loading: () =>
          SliverToBoxAdapter(child: CustomCircularProgressIndicator()),
    );
  }
}
