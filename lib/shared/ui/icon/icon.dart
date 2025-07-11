import 'package:flutter/material.dart';

import 'data_types/types.dart';
import 'icon_data.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.data, this.color, this.size = 24});

  final CustomIconData data;
  final Color? color;
  final double size;

  CustomIcon.asset(String asset, {super.key, this.color, this.size = 24})
    : data = StringIconData(asset);

  CustomIcon.icon(IconData icon, {super.key, this.color, this.size = 24})
    : data = DefaultIconData(icon);

  @override
  Widget build(BuildContext context) => data.build(size, color);
}
