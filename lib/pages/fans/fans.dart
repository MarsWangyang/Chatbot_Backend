import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/utils/utils.dart';
import 'package:poc_userstory_1/common/values/values.dart';
import 'package:poc_userstory_1/common/widgets/widgets.dart';

class FansPage extends StatefulWidget {
  FansPage({Key? key}) : super(key: key);

  @override
  _FansPageState createState() => _FansPageState();
}

class _FansPageState extends State<FansPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    debugPrint("test: " + range.toString());
  }

  Future<void> _selectDate1(BuildContext context) async {
    final range = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    debugPrint("test Date Picker: " + range.toString());
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
              toastInfo(msg: "這是好友分析畫面");
            },
          ),
        ],
      ),
      drawer: SelfDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: setWidth(350),
              height: setHeight(80),
              margin: EdgeInsets.only(
                top: 100,
                left: 32,
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '近七日好友人數',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text('500人'),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.orange[300],
                    width: 8,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '近七日封鎖人數',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text('8人'),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.orange[300],
                    width: 8,
                    indent: 20,
                    endIndent: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.history,
                      color: AppColors.primaryBackground,
                    ),
                    onPressed: () async {
                      final result = await _selectDate(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
