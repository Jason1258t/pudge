import 'package:flutter/material.dart';

abstract interface class CustomIconData {
  dynamic get value;

  Widget build(double size, Color? color);
}