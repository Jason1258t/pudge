import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudge/shared/theme/filters.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.asset, required this.callback});

  final String asset;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: AppFilters.backdropFilter,
          child: Container(
            width: 58,
            height: 44,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.white24, Colors.white.withAlpha(0)],
                center: Alignment(-2, 2),
                radius: 3,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.fromBorderSide(
                BorderSide(color: Colors.white54, width: 1),
              ),
            ),
            child: Center(child: SvgPicture.asset(asset, width: 20, height: 20)),
          ),
        ),
      ),
    );
  }
}
