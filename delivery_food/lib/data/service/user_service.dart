import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserService {
  late List<User> allUser = [];
  late FirebaseFirestore db;

  UserService() {
    db = FirebaseFirestore.instance;
    _init();
  }

  _init() async {
    await getAllUser();
  }

  Future<List<User>> getAllUser() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        allUser.add(User.fromJson(doc.id, doc.data()));

        // print("${doc.id} => ${doc.data()}");
      }
    });

    return  allUser;
  }

  Future<User> getUser(String id) async {
    for (User user in allUser) {
      if (user.id == id) {
        return user;
      }
    }
    return const User();
  }

  Future<String> addUser(User user) async {
    String id = "";
    db
        .collection("users")
        .add(user.toJson())
        .then((DocumentReference doc) => id = doc.id);

    return id;
  }

  Future<bool> checkUserName(String userName)async{
    for (var user in allUser) {
      if (user.username == userName) {
        return true;
      }
    }
    return false;
  }

  Future updateUser(User user) async {
    try {
      await db.collection("users").doc(user.id).update(user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> checkUser(String username, String passwork) async {
    await _init();
    for (var user in allUser) {
      if (user.username == username && user.password == passwork) {
        return user.id!;
      }
    }
    return "";
  }
}
