import 'package:flutter/widgets.dart';

import 'dart:math' as math;

class Responsive {
  Responsive(BuildContext context) : size = MediaQuery.sizeOf(context);

  final Size size;

  double get width => size.width;
  double get height => size.height;
  bool get isLandscape => size.width > size.height;

  double get base => math.min(size.shortestSide, 600);

  double wp(double percent) => size.width * percent / 100;
  double hp(double percent) => size.height * percent / 100;
  double sp(double percent) => base * percent / 100;
  double font(double percent) => base * percent / 100;
}

extension ResponsiveContext on BuildContext {
  Responsive get r => Responsive(this);
}
