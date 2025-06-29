import 'package:flutter/material.dart' hide Image;
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/features/profile/presentation/profile_notifier/user_notifier.dart';
import 'package:pudge/pages/profile/ui/images_grid.dart';
import 'package:pudge/pages/profile/ui/profile_tabs.dart';
import 'package:pudge/pages/profile/ui/user_info/user_info.dart';
import 'package:pudge/shared/ui/animations/circular_progress_indicator.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';

import '../../entities/image/image.dart';
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

  final user = User(
    id: '1',
    username: "John Doe",
    bio: "Talent creator from pudge app",
    avatar: Image(
      id: "1",
      originalUrl:
          "https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg",
    ),
  );

  final images = [
    "https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg",
    "https://i.pinimg.com/736x/45/87/ba/4587baafd4ee717696c886585ee0ccf1.jpg",
    "https://i.pinimg.com/736x/ac/3d/04/ac3d0448febbd8fb437fba6effb8b18a.jpg",
    "https://i.pinimg.com/736x/80/66/92/806692328c09a53d6dab591863db10a1.jpg",
    "https://i.pinimg.com/736x/c9/e6/48/c9e6486eabe6a4e97a58148eada7fe99.jpg",
    "https://i.pinimg.com/736x/21/e1/34/21e134bbc846c2b89d92bff19b6e0a9a.jpg",
    "https://i.pinimg.com/736x/96/85/56/9685564b9dee09932cd04163b710335b.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(currentProfileNotifierProvider);

    return CustomScaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          userData.when(
            data: (data) => UserInfo(data!),
            error: (e, st) => SliverToBoxAdapter(child: ErrorWidget(e)),
            loading: () => SliverToBoxAdapter(child: CustomCircularProgressIndicator()),
          ),
          SliverGap(AppSpacing.lg),
          ProfileTabs(selected: _currentPage, onSelect: selectPage),
          SliverGap(AppSpacing.md),
          ProfileImagesGrid(images: [...images, ...images, ...images]),
        ],
      ),
    );
  }
}
