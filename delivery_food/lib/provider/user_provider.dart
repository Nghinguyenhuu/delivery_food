import 'package:delivery_food/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../data/model/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _ListUser = [];
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
    // notifyListeners();
  }
  _init() async {
    _ListUser = await userRepository.getAllUser();
    notifyListeners();

    // notifyListeners();
  }

  Future<bool> getUser(String userName, String passwork) async {
    await _init();
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
    _init();
    notifyListeners();
  }

  Future updateUser(User user) async {
    userRepository.updateUser(user);
    _user = user;
    _init();
    notifyListeners();
  }
}
