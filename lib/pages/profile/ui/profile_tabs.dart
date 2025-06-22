import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/pages/profile/model/profile_tabs.dart';
import 'package:pudge/shared/ui/buttons/outline_button.dart';

import 'package:pudge/core/theme/theme.dart';

class ProfileTabs extends StatelessWidget {
  final ProfilePostsTypeEnum selected;
  final ValueChanged<ProfilePostsTypeEnum> onSelect;

  const ProfileTabs({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomOutlineButton(
            highlight: selected == ProfilePostsTypeEnum.saved,
            text: "Saved works",
            callback: () => onSelect(ProfilePostsTypeEnum.saved),
          ),
          Gap(AppSpacing.md),
          CustomOutlineButton(
            highlight: selected == ProfilePostsTypeEnum.released,
            text: "Releases",
            callback: () => onSelect(ProfilePostsTypeEnum.released),
          ),
        ],
      ),
    );
  }
}
