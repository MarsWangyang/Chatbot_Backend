import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/utils/utils.dart';
import 'package:poc_userstory_1/common/values/values.dart';
import 'package:poc_userstory_1/common/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //好友分析
  Widget _buildDashboard() {
    return Container(
      width: setWidth(350),
      height: setHeight(200),
      margin: EdgeInsets.only(top: setHeight(170)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Radii.setRadius(10),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: setHeight(38)),
                    child: Text(
                      '目前好友人數',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: setFontSize(25),
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: setHeight(30)),
                    child: Text(
                      '500人',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: setFontSize(25),
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 80,
                child: VerticalDivider(color: Colors.red),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: setHeight(38)),
                    child: Text(
                      '目前封鎖人數',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: setFontSize(25),
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: setHeight(30)),
                    child: Text(
                      '80人',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: setFontSize(25),
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            //margin: EdgeInsets.only(bottom: setHeight(0)),
            child: btnFlatButtonWidget(
              width: 350,
              title: 'Detail',
              radiusLeftTop: 3,
              radiusRightTop: 3,
              fontWeight: FontWeight.w500,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/fans',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //扁平按鈕1--ChatRoom
  Widget _buildChatRoomButton() {
    return Container(
      width: setWidth(140),
      height: setHeight(110),
      child: btnFlatButtonWidget(
          width: 140,
          height: 110,
          fontWeight: FontWeight.w500,
          title: "Chat Room",
          fontSize: setFontSize(20),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/chatroom',
            );
          }),
    );
  }

  //扁平按鈕2--Group Message
  Widget _buildGroupMessageButton() {
    return Container(
      width: setWidth(140),
      height: setHeight(110),
      child: btnFlatButtonWidget(
          width: 140,
          height: 110,
          fontWeight: FontWeight.w500,
          title: "群發訊息",
          fontSize: setFontSize(20),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/group_messages',
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      key: _scaffoldKey,
      appBar: transparentAppBar(
        context: context,
        scaffoldKey: _scaffoldKey,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              toastInfo(msg: "這是主畫面");
            },
          ),
        ],
      ),
      drawer: SelfDrawer(context),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildDashboard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: _buildChatRoomButton(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: _buildGroupMessageButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
