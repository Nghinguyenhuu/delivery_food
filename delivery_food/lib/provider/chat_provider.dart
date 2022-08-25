import 'package:delivery_food/data/model/chat/group_chat.dart';
import 'package:delivery_food/data/model/chat/group_message.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/data/repositories/chat_reposiory.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends ChangeNotifier {
  List<GroupChat> _listAllGroupChat = [];
  List<GroupChat> _lisGroupchatisUser = [];
  List<GroupMessage> _listGroupMessage = [];
  Map<String, List<GroupMessage>> _listAllMesage = {};
  String? idOnerUser;
  String? idChat;
  ChatRepository chatRepository = ChatRepositoryImpl();

  List<GroupChat> get lisGroupchatInUser {
    return _lisGroupchatisUser;
  }

  List<GroupMessage> get listGroupMesgae {
    return _listGroupMessage;
  }

  List<GroupChat> get listAllGroupchat {
    return _listAllGroupChat;
  }

  ChatProvider() {
    _init();
  }

  _init() async {
    await getAllChat();
    await getAllMessage();
    notifyListeners();
  }

  getAllChat() async {
    _listAllGroupChat.clear();
    _listAllGroupChat = await chatRepository.getAllChat();
    notifyListeners();
  }

  getAllMessage() async {
    _listAllMesage.clear();
    _listAllMesage = await chatRepository.getAllMessage();
    notifyListeners();
  }

  getAllChatInUser(String idUser) async {
    _lisGroupchatisUser = await chatRepository.getAllChatInUser(idUser);
    notifyListeners();
  }

  getAllMessageInId(String idChat) async {
    _listGroupMessage = await chatRepository.getAllMessageInId(idChat);
    notifyListeners();
  }

  addMessage(GroupMessage groupMessage, String idChat) async {
    await chatRepository.addMessage(idChat, groupMessage);
    getAllMessageInId(idChat);
    notifyListeners();
  }

  GroupChat getGroupChat(String idChat) {
    for (var gChar in _listAllGroupChat) {
      if (gChar.id == idChat) {
        return gChar;
      }
    }
    return GroupChat();
  }

  String getOerUser(String idChat, User user) {
    for (var grChat in _listAllGroupChat) {
      if (grChat.id == idChat) {
        return grChat.idUser1 != user.id
            ? "${grChat.idUser1}"
            : "${grChat.idUser2}";
      }
    }
    return "";
  }
}
