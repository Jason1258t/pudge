import 'package:flutter/material.dart';

/// Core border radius values for UI components.
/// Use consistently to maintain rounded corners throughout the app.
abstract class AppRadii {
  static const Radius zero = Radius.circular(0);
  static const Radius sm = Radius.circular(4);
  static const Radius md = Radius.circular(8);
  static const Radius lg = Radius.circular(12);
  static const Radius xl = Radius.circular(16);

  /// fully rounded
  static const Radius pill = Radius.circular(1000);

  static const BorderRadius allSm = BorderRadius.all(sm);
  static const BorderRadius allMd = BorderRadius.all(md);
  static const BorderRadius allLg = BorderRadius.all(lg);
  static const BorderRadius allXl = BorderRadius.all(xl);
  static const BorderRadius full = BorderRadius.all(pill);
}
