import '../data/model/chat/group_message.dart';
import '../data/model/user.dart';

class ChatMessageArgument {
  String idchat;
  User ornerUser;
  List<GroupMessage> listGroupMesgae;

  ChatMessageArgument(
      {required this.idchat,
      required this.ornerUser,
      required this.listGroupMesgae});
}
