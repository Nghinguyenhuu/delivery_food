import 'package:cloud_firestore/cloud_firestore.dart';

class GroupMessage {
  String? id;
  String? idFrom;
  String? messages;
  DateTime? time;
  bool? type;

  GroupMessage({this.id, this.idFrom, this.messages, this.time, this.type});

  factory GroupMessage.fromJson(String id, Map<String, dynamic> json) {
    return GroupMessage(
        id: id,
        idFrom: json["idFrom"],
        messages: json["messages"],
        time: DateTime.parse(json["time"].toDate().toString()) ,
        type: json["type"]);
  }

  Map<String, dynamic> toJson() {
    return {"idFrom": idFrom, "messages": messages, "time": Timestamp.fromDate(time!), "type": type};
  }
}
