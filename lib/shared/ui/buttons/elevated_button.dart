import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.callback,
    required this.text,
    this.active = true,
  });

  final VoidCallback callback;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: active ? callback : () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.allLg),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        height: 58,
        decoration: BoxDecoration(
          borderRadius: AppRadii.allLg,
          gradient: active ? AppGradients.inst : AppGradients.instDisabled,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
