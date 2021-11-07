import 'package:flutter_screenutil/flutter_screenutil.dart';
/*
  This file is mainly for screen height, width etc.

  ScreenUtil.pixelRatio //設備的像素密度
  ScreenUtil.screenWidth  //設備的寬度
  ScreenUtil.screenHeight //設備高度
  ScreenUtil.bottomBarHeight //底部安全區域的距離，適用於全螢幕下面有按鈕的
  ScreenUtil.statusBarHeight //狀態欄高度，瀏海螢幕會更高 單位是px
  ScreenUtil.textScaleFactor //系統字體縮放的比例

  ScreenUtil().scaleWidth // 實際寬度的dp與設計稿px的比例
  ScreenUtil().scaleHeight // 實係高度的dp與設計稿px的比例
*/

//Init

//Setting Width
double setWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double setHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double setFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
