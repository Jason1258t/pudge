import 'package:flutter/material.dart';

import '../icon_data.dart';

class DefaultIconData implements CustomIconData {
  @override
  final IconData value;

  DefaultIconData(this.value);

  @override
  Widget build(double size, Color? color) {
    return Icon(value, size: size, color: color);
  }
}
