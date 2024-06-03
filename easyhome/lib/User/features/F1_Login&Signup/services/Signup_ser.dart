import 'package:dio/dio.dart';

import 'package:easyhome/Models/User_model.dart';

Dio dio = Dio();

class Signup_ser {
  late String result;
  UserYasser user = UserYasser();
  Future<bool> sign_up_post(
      String firstName,
      String lastName,
      String wilaya,
      String phoneNumber,
      String email,
      String password,
      String passwordConfirm) async {
    String postUrl = 'https://easyhome-lcvx.onrender.com/api/v1/auth/signup';
    dio.options.headers['Content-type'] = 'application/json';
    final data = {
      "firstName": firstName,
      "lastName": lastName,
      "wilaya": wilaya,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "passwordConfirm": passwordConfirm,
    };
    try {
      Response response = await dio.post(postUrl, data: data);
      if (response.statusCode == 200) {
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
        // Error without response data
        print('Error: $error');
      }
      return false;
    }
  }
}
