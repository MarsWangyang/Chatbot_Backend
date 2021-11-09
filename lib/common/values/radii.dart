import 'package:flutter/rendering.dart';

class Radii {
  //static BorderRadiusGeometry? radius;

  static BorderRadiusGeometry setRadius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }

  static BorderRadiusGeometry setRaidusIndi({
    double radiusRightTop = 10,
    double radiusRightBottom = 10,
    double radiusLeftTop = 10,
    double radiusLeftBottom = 10,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(radiusLeftTop),
      topRight: Radius.circular(radiusRightTop),
      bottomLeft: Radius.circular(radiusLeftBottom),
      bottomRight: Radius.circular(radiusRightBottom),
    );
  }
}
