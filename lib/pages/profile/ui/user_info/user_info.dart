import 'package:flutter/material.dart';
import 'package:pudge/entities/user/user/user.dart';
import 'package:pudge/pages/profile/ui/user_info/user_collapsed.dart';
import 'package:pudge/pages/profile/ui/user_info/user_expanded.dart';
import 'package:pudge/shared/ui/app_bars/sliver_collapsing_header.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SliverCollapsingHeader(
      expandedHeight: 220,
      collapsedHeight: 64,
      expandedBuilder: expandedBuilder,
      collapsedBuilder: collapsedBuilder,
    );
  }

  Widget expandedBuilder(BuildContext context, double maxHeight) =>
      UserExpanded(user: user, maxHeight: maxHeight);

  Widget collapsedBuilder(BuildContext context) => UserCollapsed(user: user);
}
