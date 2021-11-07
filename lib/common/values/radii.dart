import 'package:flutter/rendering.dart';

class Radii {
  //static BorderRadiusGeometry? radius;

  static BorderRadiusGeometry setRadius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }
}
