import 'package:delivery_food/data/model/chat/group_chat.dart';
import 'package:delivery_food/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../data/model/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _ListUser = [];
  User ornerUser = User();
  User _user = User();
  UserReposirory userRepository = UserReposiroryImpl();

  List<User> get listUser {
    return _ListUser;
  }

  User get user {
    return _user;
  }

  UserProvider() {
    _init();
  }

  _init() async {
    _ListUser.clear();
    _ListUser = await userRepository.getAllUser();
    notifyListeners();
  }

  Future<bool> getUser(String userName, String passwork) async {
    // await _init();
    for (var user in _ListUser) {
      if (user.username == userName && user.password == passwork) {
        _user = user;
        notifyListeners();
        return true;
      }
    }
    notifyListeners();
    return false;
  }

  Future addUser(User user) async {
    await userRepository.addUser(user);
    _ListUser.add(user);
    _init();
    notifyListeners();
  }

  Future updateUser(User user) async {
    userRepository.updateUser(user);
    _user = user;
    _init();
    notifyListeners();
  }

  Future<User> findUser(String id) async {
    await _init();
    for (var user in _ListUser) {
      if (user.id == id) {
        notifyListeners();
        return user;
      }
    }
    notifyListeners();
    return User();
  }

  Future logoutUser() async {
    _user = User();
    notifyListeners();
  }

  User findOeruser(String id) {
    for (var user in _ListUser) {
      if (user.id == id) {
        return user;
      }
    }
    return User();
  }
}
