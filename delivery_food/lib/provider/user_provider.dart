import 'package:delivery_food/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../data/model/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _listUser = [];
  User _user =  User();
  UserReposirory userRepository = UserReposiroryImpl();

  List<User> get listUser {
    return _listUser;
  }

  User get user {
    return _user;
  }

  UserProvider() {
    _init();
    notifyListeners();
  }
  _init() async {
    _listUser = await userRepository.getAllUser();
    notifyListeners();

    // notifyListeners();
  }

  Future<bool> checkUser(String userName, String passwork) async {
    await _init();
    for (var user in _listUser) {
      if (user.username == userName && user.password == passwork) {
        _user = user;
        notifyListeners();
        return true;
      }
    }
    notifyListeners();
    return false;
  }

  Future<User> getUser(String id)async{
    _init();
    print(id);
    User user =await userRepository.getUser(id);
    print("provider ${user.id}");
    notifyListeners();
    return user ;
  }

  Future<String> addUser(User user) async {
    String id = await userRepository.addUser(user);

    _init();
    notifyListeners();
    return id;
  }

  Future<bool> updateUser(User user) async {
    bool isSuccess = await userRepository.updateUser(user);
    _user = user;
    _init();
    notifyListeners();
    return isSuccess;
  }

  Future<bool> checkUsernameContain(String userName)async{
    await _init();
    bool isContains = await userRepository.checkUserName(userName);
    notifyListeners();
    
    return isContains ;
  }
}
