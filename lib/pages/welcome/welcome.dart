import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_userstory_1/common/utils/utils.dart';
import 'package:poc_userstory_1/common/values/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //Title
  Widget _buildWelcomePageTitle() {
    return Container(
      margin: EdgeInsets.only(top: setHeight(275)),
      child: Text(
        "Welcome\nTo\nJBWStudio",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          height: setHeight(1.3),
          fontFamily: "Helvetica",
          fontWeight: FontWeight.w600,
          fontSize: setFontSize(40),
        ),
      ),
    );
  }

  //Button
  Widget _buildWelcomePageButton() {
    return Container(
      width: setWidth(295),
      height: setHeight(45),
      margin: EdgeInsets.only(bottom: setHeight(50)),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Helvetica",
            fontSize: 23,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/sign_in",
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: 375,
        maxHeight: 812 - 44 - 34,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildWelcomePageTitle(),
            Spacer(),
            _buildWelcomePageButton(),
          ],
        ),
      ),
    );
  }
}
