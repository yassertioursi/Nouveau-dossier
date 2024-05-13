import 'package:dio/dio.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/Models/User_model.dart';
import 'package:flutter/material.dart';

Dio dio = Dio();

class Login_ser {
  UserYasser user = new UserYasser();
  late String result;
  Future<bool> login_post(String email, String password) async {
    String postUrl = 'https://easyhome-lcvx.onrender.com/api/v1/auth/login';
    dio.options.headers['Content-type'] = 'application/json';
    final data = {
      "email": email,
      "password": password,
    };

    try {
      Response response = await dio.post(postUrl, data: data);
      if (response.statusCode == 200) {
        user.fromJson(response.data['user']);
        print(user.name);

        return true;
      } else {
        return false;
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print('Error Response data: ${error.response!.data}');
        result = error.response!.data['message'];
        print('Error Response status: ${error.response!.statusCode}');
        print('Error Response headers: ${error.response!.headers}');
      } else {
        print('Error: $error');
      }
      return false;
    }
  }
}
