import '../model/user.dart';
import '../service/user_service.dart';

abstract class UserReposirory{
  Future<List<User>> getAllUser();
  Future<User> getUser(String id);
  Future<String> checkUser(String username, String passwork);
  Future addUser(User user);
  Future<User> updateUser(User user);
}

class UserReposiroryImpl implements UserReposirory{
  static UserService userService = UserService();
  @override
  Future addUser(User user) async {
   return userService.addUser(user);
  }

  @override
  Future<String> checkUser(String username, String passwork) async{
    return await userService.checkUser(username, passwork);
  }

  @override
  Future<List<User>> getAllUser() async{
    return await userService.allUser;
  }

  @override
  Future<User> getUser(String id) async{
    return userService.getUser(id);
  }
  
  @override
  Future<User> updateUser(User user) async{
   await  userService.updateUser(user);
   return user;
  }

}