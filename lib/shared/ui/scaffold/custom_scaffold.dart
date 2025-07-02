import 'package:flutter/material.dart';
import 'package:pudge/core/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.backgroundColor = AppColors.background,
    this.padding,
    this.centerContent = false,
    this.body, this.appBar, this.enableResize = false, this.bottomNavigationBar
  });

  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool centerContent;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final bool enableResize;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final content = centerContent ? Center(child: body) : body;

    return Scaffold(
      resizeToAvoidBottomInset: enableResize,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      body: Padding(padding: padding ?? EdgeInsets.zero, child: content),
    );
  }
}
