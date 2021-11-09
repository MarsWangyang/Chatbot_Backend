import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/values/values.dart';
import 'package:poc_userstory_1/common/widgets/widgets.dart';

Widget SelfDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Image.asset("assets/images/banner.jpg", fit: BoxFit.cover),
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
          ),
          padding: EdgeInsets.zero,
        ),
        ListTile(
          title: Text(
            'Home',
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/home',
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text(
            '好友人數分析',
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/fans',
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text(
            '用戶聊天室',
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/chatroom',
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text(
            '群發訊息',
            textAlign: TextAlign.left,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/group_messages',
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text(
            '設定',
            textAlign: TextAlign.left,
          ),
          onTap: () {
            toastInfo(msg: "Sorry\nNo Setting Page Yet!");
          },
        ),
        Divider(),
      ],
    ),
  );
}
