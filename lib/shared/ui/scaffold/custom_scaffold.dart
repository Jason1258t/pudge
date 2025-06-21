import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.backgroundColor,
    this.padding,
    this.centerContent = false,
    this.body,
  });

  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool centerContent;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final content = centerContent ? Center(child: body) : body;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(padding: padding ?? EdgeInsets.zero, child: content),
    );
  }
}
