import 'package:flutter/material.dart';
import 'package:pudge/core/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.backgroundColor = AppColors.background,
    this.padding,
    this.centerContent = false,
    this.body, this.appBar,
  });

  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool centerContent;
  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final content = centerContent ? Center(child: body) : body;

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: Padding(padding: padding ?? EdgeInsets.zero, child: content),
    );
  }
}
