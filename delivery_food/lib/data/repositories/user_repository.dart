import '../model/user.dart';
import '../service/user_service.dart';

abstract class UserReposirory{
  Future<List<User>> getAllUser();
  Future<User> getUser(String id);
  Future<String> checkUser(String username, String passwork);
  Future<String> addUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> checkUserName(String username);

}

class UserReposiroryImpl implements UserReposirory{
  static UserService userService = UserService();
  @override
  Future<String> addUser(User user) async {
   return userService.addUser(user);
  }

  @override
  Future<String> checkUser(String username, String passwork) async{
    return await userService.checkUser(username, passwork);
  }

  @override
  Future<List<User>> getAllUser() async{
    return  userService.allUser;
  }

  @override
  Future<User> getUser(String id) async{
    return userService.getUser(id);
  }
  
  @override
  Future<bool> updateUser(User user) async{
   bool isSuccess = await userService.updateUser(user);
   return isSuccess;
  }
  
  @override
  Future<bool> checkUserName(String username)async{
    bool isContains = await userService.checkUserName(username);
    return isContains;
  }

}