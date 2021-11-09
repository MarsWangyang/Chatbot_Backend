import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/values/values.dart';
import 'package:poc_userstory_1/common/widgets/widgets.dart';

AppBar transparentAppBar({
  required BuildContext context,
  Widget? drawer,
  List<Widget>? actions,
  GlobalKey<ScaffoldState>? scaffoldKey,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(''),
    leading: IconButton(
      icon: Icon(
        Icons.list,
        color: Colors.white,
      ),
      onPressed: () {
        scaffoldKey!.currentState!.openDrawer();
      },
    ),
    actions: actions,
  );
}
