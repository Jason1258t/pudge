import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/core/theme/colors.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadii.full,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
