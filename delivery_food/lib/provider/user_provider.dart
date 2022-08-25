import 'package:delivery_food/data/model/chat/group_chat.dart';
import 'package:delivery_food/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../data/model/user.dart';

class UserProvider extends ChangeNotifier {
<<<<<<< HEAD
  List<User> _listUser = [];
  User _user =  User();
=======
  List<User> _ListUser = [];
  User ornerUser = User();
  User _user = User();
>>>>>>> origin/nghia_dev_feature_chat
  UserReposirory userRepository = UserReposiroryImpl();

  List<User> get listUser {
    return _listUser;
  }

  User get user {
    return _user;
  }

  UserProvider() {
    _init();
<<<<<<< HEAD
<<<<<<< HEAD
    notifyListeners();
=======
>>>>>>> origin/nghia_dev_feature_chat
=======
    // notifyListeners();
>>>>>>> parent of d497ec4 (fix update info)
  }

  _init() async {
<<<<<<< HEAD
    _listUser = await userRepository.getAllUser();
=======
    _ListUser.clear();
    _ListUser = await userRepository.getAllUser();
>>>>>>> origin/nghia_dev_feature_chat
    notifyListeners();
  }

<<<<<<< HEAD
  Future<bool> checkUser(String userName, String passwork) async {
    await _init();
    for (var user in _listUser) {
=======
  Future<bool> getUser(String userName, String passwork) async {
    // await _init();
    for (var user in _ListUser) {
>>>>>>> origin/nghia_dev_feature_chat
      if (user.username == userName && user.password == passwork) {
        _user = user;
        notifyListeners();
        return true;
      }
    }
    notifyListeners();
    return false;
  }

<<<<<<< HEAD
  Future<User> getUser(String id)async{
<<<<<<< HEAD
=======
  Future addUser(User user) async {
    await userRepository.addUser(user);
    _ListUser.add(user);
>>>>>>> origin/nghia_dev_feature_chat
    _init();
    print(id);
=======
    _init;
>>>>>>> parent of d497ec4 (fix update info)
    User user =await userRepository.getUser(id);
    notifyListeners();
    return user ;
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

  Future<bool> checkUsernameContain(String userName)async{
    _init();
    bool isContains = await userRepository.checkUserName(userName);
    notifyListeners();
    return isContains ;
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
