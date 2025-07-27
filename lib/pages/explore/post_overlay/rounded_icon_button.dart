import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';

class RoundedIconButton extends StatefulWidget {
  const RoundedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.size = 48,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final Color backgroundColor;
  final double size;

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        child: Ink(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: AppRadii.full,
          ),
          child: Center(child: widget.icon),
        ),
      ),
    );
  }
}
