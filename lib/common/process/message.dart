import 'dart:async';
import 'dart:io';
import 'dart:convert';

Future<List> fetchLog() {
  String path = '/Users/mars/Development/cxcxc/linebot/mockdata/flask.log';
  Stream file = _readLog(path);
  Future<List> fileInfoList = _processJSON(file);

  Future<List> fileInfo = fileInfoList;

  return fileInfo;
}

Stream _readLog(String path) {
  var file =
      new File(path).openRead().map(utf8.decode).transform(new LineSplitter());
  return file;
}

Future<List<Repo>> _processJSON(Stream file) async {
  List<dynamic> fileList = await file.toList();
  int fileLength = await fileList.length;

  List<Repo>? recordInfoList = [];
  for (int i = 0; i < fileLength; i++) {
    String line = fileList[i];
    if (line.startsWith('Response Body')) {
      String body = line.split("Body: ")[1];
      Map<String, dynamic> responseBody = jsonDecode(body);
      Repo res = Repo.fromJson('Response Body', responseBody);
      recordInfoList.add(res);
    } else if (line.startsWith('Request Body')) {
      String body = line.split("Body: ")[1];
      Map<String, dynamic> requestBody = jsonDecode(body);
      Repo req = Repo.fromJson('Request Body', requestBody);
      recordInfoList.add(req);
    } else {
      continue;
    }
  }

  return recordInfoList;
}

class Repo {
  String? type;
  String? userId;
  String? message;
  String? timestamp;
  String? bodyType;

  Repo({
    this.type,
    this.userId,
    this.message,
    this.timestamp,
    this.bodyType,
  });

  factory Repo.fromJson(String bodyType, Map<String, dynamic> json) {
    //String typeOfJson = json['events'][0]['type'];
    if (bodyType == 'Request Body') {
      String type = json['events'][0]['type'];
      String userId = json['events'][0]['source']['userId'];
      String timestamp = json['events'][0]['timestamp'].toString();
      if (type == 'follow' || type == 'unfollow') {
        String message = "Follow/Ufollow";
        return Repo(
          type: type,
          userId: userId,
          message: message,
          timestamp: timestamp,
          bodyType: bodyType,
        );
      } else {
        String message = json['events'][0]['message']['text'];
        return Repo(
          type: type,
          userId: userId,
          message: message,
          timestamp: timestamp,
          bodyType: bodyType,
        );
      }
    } else if (bodyType == 'Response Body') {
      String type = json['type'];
      if (type == 'message') {
        String userId = json['source']['userId'];
        String message = json['message']['text'];
        String timestamp = json['timestamp'].toString();
        return Repo(
          type: type,
          userId: userId,
          message: message,
          timestamp: timestamp,
          bodyType: bodyType,
        );
      } else {
        String userId = json['source']['userId'];
        String message = type;
        String timestamp = json['timestamp'].toString();
        return Repo(
          type: type,
          userId: userId,
          message: message,
          timestamp: timestamp,
          bodyType: bodyType,
        );
      }
    } else {
      return Repo(
        type: 'Default type',
        userId: 'No userId',
        message: 'Default message',
        timestamp: 'No timestamp',
      );
    }
  }
}
