import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/core/utils/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: AppRadii.allMd,
        image: DecorationImage(image: AssetImage(Assets.image('pudge.jpg'))),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(150),
            spreadRadius: 3,
            blurRadius: 15,
          ),
        ],
      ),
    );
  }
}
