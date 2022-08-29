class GroupChat {
  String? id;
  String? idUser1;
  String? idUser2;

  GroupChat({this.id, this.idUser1, this.idUser2});

  factory GroupChat.fromJson(String id, Map<String, dynamic> json) {
    return GroupChat(
        id: id, idUser1: json["idUser1"], idUser2: json["idUser2"]);
  }

  Map<String, dynamic> toJson() {
    return {"idUser1": idUser1, "idUser2": idUser2};
  }
}
