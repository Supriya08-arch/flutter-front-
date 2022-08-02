import 'package:getx/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:getx/pages/login/model/userModel.dart';
import 'package:getx/pages/login/response/Response.dart';
import 'httpservices.dart';

class UserAPI {
  // funtion banayeko
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    // Server bata response aucha
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(), // data pathayeko
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
