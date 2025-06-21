import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.callback,
    required this.text,
  });

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.allLg),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        height: 58,
        decoration: BoxDecoration(
          borderRadius: AppRadii.allLg,
          gradient: AppGradients.inst,
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
