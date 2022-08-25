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

    return allUser;
  }

  Future<User> getUser(String id) async {
    _init();
    // print(id);
    User user = User();
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        if(doc.id==id){
            user= User.fromJson(doc.id, doc.data());
        }
        // allUser.add(User.fromJson(doc.id, doc.data()));

        // print("${doc.id} => ${doc.data()}");
      }
    });
    // print(user.id);
    return user;
  }
  
  Future<String> addUser(User user) async {
    String id = "";
    await db
        .collection("users")
        .add(user.toJson())
        .then((DocumentReference doc) => id = doc.id);
   
    return id;
  }
  Future<User> getUserByName(String userName) async {
    _init();
    
    User user = User();
    for (var element in allUser) {
      if(element.username == userName ){
        user = element;
      }
    }
    return user;
  }

  Future<bool> checkUserName(String userName) async {
    for (var user in allUser) {
      if (user.username == userName) {
        return true;
      }
    }
    return false;
  }

  Future<bool> updateUser(User user) async {
    try {
      await db.collection("users").doc(user.id).update(user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkUser(String username, String passwork) async {
    await _init();
    for (var user in allUser) {
      if (user.username == username && user.password == passwork) {
        return true;
      }
    }
    return false;
  }
}