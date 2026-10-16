import 'package:flutter/widgets.dart';

import 'dart:math' as math;

class Responsive {
  Responsive(BuildContext context)
    : size = MediaQuery.sizeOf(context),
      padding = MediaQuery.paddingOf(context);

  final Size size;
  final EdgeInsets padding;

  double get width => size.width;
  double get height => size.height;
  bool get isLandscape => size.width > size.height;

  double get base => math.min(size.shortestSide, 600);

  double wp(double percent) => size.width * percent / 100;
  double hp(double percent) => size.height * percent / 100;
  double sp(double percent) => base * percent / 100;
  double font(double percent) => base * percent / 100;

  double get gap => base * 0.04;
  double get pad => base * 0.05;
  double get radius => base * 0.04;
}

extension ResponsiveContext on BuildContext {
  Responsive get r => Responsive(this);
}
