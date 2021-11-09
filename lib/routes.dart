import 'package:poc_userstory_1/pages/group_messages/group_messages.dart';
import 'package:poc_userstory_1/pages/sign_in/sign_in.dart';
import 'package:poc_userstory_1/pages/home/home.dart';
import 'pages/chatroom/chatroom.dart';
import 'pages/fans/fans.dart';

//static router
var staticRoutes = {
  '/sign_in': (context) => SignInPage(), //Admin Login
  '/home': (context) => HomePage(),
  '/fans': (context) => FansPage(),
  '/chatroom': (context) => ChatRoomPage(),
  '/group_messages': (context) => GroupMessagePage(),
};
