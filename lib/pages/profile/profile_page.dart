import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/pages/profile/ui/images_grid.dart';
import 'package:pudge/pages/profile/ui/profile_tabs.dart';
import 'package:pudge/pages/profile/ui/user_info/user_info.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';

import 'model/profile_tabs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    avatarUrl:
        "https://i.pinimg.com/736x/63/b8/6b/63b86b5e857734b03c97791ac700d2c1.jpg",
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
    return CustomScaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          UserInfo(user),
          SliverGap(AppSpacing.lg),
          ProfileTabs(selected: _currentPage, onSelect: selectPage),
          SliverGap(AppSpacing.md),
          ProfileImagesGrid(images: [...images, ...images, ...images]),
        ],
      ),
    );
  }
}
