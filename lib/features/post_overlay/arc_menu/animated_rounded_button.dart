import 'package:flutter/material.dart';
import 'package:pudge/pages/explore/post_overlay/rounded_icon_button.dart';
import 'package:pudge/shared/ui/icon/icon.dart';

class AnimatedRoundedButton extends StatelessWidget {
  const AnimatedRoundedButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.active,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      scale: active ? 1.2 : 1,
      child: RoundedIconButton(
        onPressed: onPressed,
        icon: CustomIcon.icon(icon),
        backgroundColor: active ? Colors.deepPurple[300]! : Colors.white,
      ),
    );
  }
}
