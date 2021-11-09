import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/utils/utils.dart';
import 'package:poc_userstory_1/common/values/values.dart';

Widget btnFlatButtonWidget({
  @required VoidCallback? onPressed,
  double width = 295,
  double height = 44,
  Color gbColor = AppColors.buttonBackground,
  String title = "button",
  Color fontColor = AppColors.primaryText,
  double fontSize = 18,
  String fontName = "Helvetica",
  FontWeight fontWeight = FontWeight.w400,
  double radiusRightTop = 10,
  double radiusRightBottom = 10,
  double radiusLeftTop = 10,
  double radiusLeftBottom = 10,
}) {
  return Container(
    width: setWidth(width),
    height: setHeight(height),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: gbColor,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.setRaidusIndi(
            radiusRightBottom: radiusRightBottom,
            radiusRightTop: radiusRightTop,
            radiusLeftBottom: radiusLeftBottom,
            radiusLeftTop: radiusLeftTop,
          ),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: setFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}
