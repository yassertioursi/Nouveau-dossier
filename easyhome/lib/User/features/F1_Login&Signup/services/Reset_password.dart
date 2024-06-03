import 'package:dio/dio.dart';

import 'package:easyhome/Models/User_model.dart';

Dio dio = Dio();

class Reset_pass_ser {
  UserYasser user = new UserYasser();
  late String result;
  Future<bool> reset_password_post(
      String email, String otp, String password, String passwordConfirm) async {
    String postUrl =
        'https://easyhome-lcvx.onrender.com/api/v1/auth/resetPassword';
    dio.options.headers['Content-type'] = 'application/json';
    final data = {
      "email": email,
      "otp": otp,
      "password": password,
      "passwordConfirm": passwordConfirm,
    };

    try {
      Response response = await dio.patch(postUrl, data: data);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response!.data);
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
