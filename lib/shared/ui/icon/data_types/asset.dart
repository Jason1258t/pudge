import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pudge/core/utils/svg_color.dart';

import '../icon_data.dart';

class StringIconData implements CustomIconData {
  @override
  final String value;

  StringIconData(this.value);

  @override
  Widget build(double size, Color? color) {
    return SvgPicture.asset(
      value,
      width: size,
      height: size,
      colorFilter: color != null ? svgColor(color) : null,
    );
  }
}
