import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/utils/utils.dart';
import 'package:poc_userstory_1/common/values/values.dart';
import 'package:poc_userstory_1/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  //SignInPage({Key? key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();

  //password的控制器
  final TextEditingController _passController = TextEditingController();

  //執行SignIn操作
  _handleSignIn() {
    if (!IsEmail(_emailController.value.text)) {
      toastInfo(msg: "請輸入正確Email");
      return;
    }
    if (!CheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密碼不可以小於6位數');
      return;
    }
  }

//登入表單
  Widget _buildInputForm() {
    return Container(
      width: setWidth(295),
      //height: setHeight(204),
      margin: EdgeInsets.only(top: setHeight(300)),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: setHeight(10),
          ),

          //password input
          inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true,
              marginTop: setHeight(30)),

          // 註冊、SignIn、橫向佈局
          Container(
            height: setHeight(44),
            margin: EdgeInsets.only(top: setHeight(30)),
            child: Row(
              children: [
                // SignIn
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.buttonBackground,
                  title: "Sign in",
                ),
              ],
            ),
          ),

          //Forgot Password
          Container(
            height: setHeight(30),
            margin: EdgeInsets.only(top: setHeight(20)),
            child: TextButton(
              onPressed: () => {},
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF57F17),
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.w400,
                  fontSize: setFontSize(16),
                  height: 0.3, //設定下行高，否則字體會下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildInputForm(),
          ],
        ),
      ),
    );
  }
}
