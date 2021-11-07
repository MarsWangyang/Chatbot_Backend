import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/utils/utils.dart';
import 'package:poc_userstory_1/common/values/values.dart';

//輸入框
Widget inputTextEdit({
  @required TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: Radii.setRadius(15),
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Helvetica",
        fontWeight: FontWeight.w400,
        fontSize: setFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}
