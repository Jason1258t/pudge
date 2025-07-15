part of 'arc_layout.dart';

enum ArcDirection { clockwise, counterClockwise }

extension ArcDirectionToInt on ArcDirection {
  int toInt() => this == ArcDirection.clockwise ? 1 : -1;
}