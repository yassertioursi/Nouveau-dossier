import 'package:dio/dio.dart';

import 'package:easyhome/Models/User_Model.dart';
import 'package:easyhome/Rechidi/core/helper/cache.dart';

import 'package:easyhome/Rechidi/core/injection/index.dart';

Dio dio = locator<Dio>();

class Verify_ser {
  UserYasser user = UserYasser();
  late String result;
  Future<bool> verify_email_post(String email, String otp) async {
    String postUrl =
        'https://easyhome-lcvx.onrender.com/api/v1/auth//verifyEmail';
    dio.options.headers['Content-type'] = 'application/json';
    final data = {
      "email": email,
      "otp": otp,
    };

    try {
      Response response = await dio.post(postUrl, data: data);
      if (response.statusCode == 201) {
        AuthCache.setToken(response.data['token']);
        user.fromJson(response.data['user']);
        AuthCache.setUserId(user.id);
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
