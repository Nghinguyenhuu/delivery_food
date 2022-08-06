import '../model/user.dart';

class UserData {
  final List<User> users = [];

 
  Future<List<User>> getAllUser() async {
    return users;
  }

  Future<void> addUser(User user) async {
    users.add(user);
  }

  Future<void> deleteUser(User user) async {
    users.remove(user);
  }

  Future<void> updateUser(User user) async {
    users.add(user);
  }

  Future<bool> checkUsernameContain(User user) async {
    return users.any((element) => element.username == user.username);
  }
}
