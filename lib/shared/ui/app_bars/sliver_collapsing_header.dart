import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class SliverCollapsingHeader extends StatelessWidget {
  const SliverCollapsingHeader({
    super.key,
    required this.expandedHeight,
    this.collapsedHeight = 64,
    required this.expandedBuilder,
    required this.collapsedBuilder,
  });

  final double expandedHeight;
  final double collapsedHeight;

  final Widget Function(BuildContext, double) expandedBuilder;
  final Widget Function(BuildContext) collapsedBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background.withAlpha(220),
      surfaceTintColor: Colors.transparent,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: AppFilters.backdropFilter,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCollapsed =
                  constraints.maxHeight <= expandedHeight - 15;
              return Container(
                alignment: Alignment.bottomLeft,
                child: isCollapsed
                    ? collapsedBuilder(context)
                    : expandedBuilder(context, constraints.maxHeight),
              );
            },
          ),
        ),
      ),
    );
  }
}
