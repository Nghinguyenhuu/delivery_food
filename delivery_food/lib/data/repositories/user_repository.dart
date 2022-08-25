import '../model/user.dart';
import '../service/user_service.dart';

abstract class UserReposirory {
  Future<List<User>> getAllUser();
  Future<User> getUser(String id);
  Future<String> checkUser(String username, String passwork);
  Future addUser(User user);
  Future<User> updateUser(User user);
  Future<bool> checkUserName(String username);

}

class UserReposiroryImpl implements UserReposirory {
  static UserService userService = UserService();
  @override
<<<<<<< HEAD
<<<<<<< HEAD
  Future<String> addUser(User user) async {
=======
  Future addUser(User user) async {
>>>>>>> parent of d497ec4 (fix update info)
   return userService.addUser(user);
=======
  Future addUser(User user) async {
    return userService.addUser(user);
>>>>>>> origin/nghia_dev_feature_chat
  }

  @override
  Future<String> checkUser(String username, String passwork) async {
    return await userService.checkUser(username, passwork);
  }

  @override
<<<<<<< HEAD
  Future<List<User>> getAllUser() async{
    return  userService.allUser;
=======
  Future<List<User>> getAllUser() async {
    return userService.getAllUser();
>>>>>>> origin/nghia_dev_feature_chat
  }

  @override
  Future<User> getUser(String id) async {
    return userService.getUser(id);
  }
<<<<<<< HEAD
  
  @override
  Future<User> updateUser(User user) async{
   await  userService.updateUser(user);
   return user;
  }
  
  @override
  Future<bool> checkUserName(String username)async{
    bool isContains = await userService.checkUserName(username);
    return isContains;
  }
=======
>>>>>>> origin/nghia_dev_feature_chat

  @override
  Future<User> updateUser(User user) async {
    await userService.updateUser(user);
    return user;
  }
}
