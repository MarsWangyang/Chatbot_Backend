import 'package:flutter/material.dart';
import 'package:poc_userstory_1/common/values/values.dart';
import 'package:poc_userstory_1/common/widgets/widgets.dart';
import 'package:poc_userstory_1/common/process/process.dart';

class ChatRoomPage extends StatefulWidget {
  ChatRoomPage({Key? key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _chatController = new TextEditingController();
  List? _messages;
  List? _botMessages;
  List? _customerMessages;
  final List<Widget> _messageWidget = [];
  final List<Widget> _botmessageWidget = [];
  final List<Widget> _customermessageWidget = [];
  void _submit(String text) {
    toastInfo(msg: text);
  }

  void _messageProcess() async {
    _messages = await fetchLog();

    for (int i = 0; i < _messages!.length; i++) {
      if (_messages![i].bodyType == "Response Body") {
        _messageWidget.insert(
          0,
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.person, size: 32),
                Flexible(
                  child: Container(
                    color: Colors.amber,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      _messages![i].message,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        _messageWidget.insert(
          0,
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.amber,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      _messages![i].message,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Icon(Icons.person, size: 32),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    _messageProcess();
    return Scaffold(
        backgroundColor: AppColors.primaryBackground,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(arguments['userName']),
          backgroundColor: Color(0xFF757575),
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (context, index) => _messageWidget[index],
                  itemCount: _messageWidget.length,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.5),
                        ),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        hintText: 'Type something here...',
                      ),
                      controller: _chatController,
                      onSubmitted: _submit,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _submit(_chatController.text),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
