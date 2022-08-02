import 'package:getx/services/userApi.dart';
import 'package:getx/pages/login/model/userModel.dart';

class UserRepository {
  Future<bool> resgisterUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> login(String email, String password) {
    return UserAPI().login(email, password);
  }
}
