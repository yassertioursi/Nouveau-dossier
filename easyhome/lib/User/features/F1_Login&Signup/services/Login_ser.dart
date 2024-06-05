import 'package:dio/dio.dart';
import 'package:easyhome/Models/User_Model.dart';
import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';

Dio dio = Dio();

class Login_ser {
  UserYasser user = UserYasser();
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
        await AuthCache.setToken(response.data['token']);
        await AuthCache.setUserId(user.id);
        await AuthCache.setIsWorker(user.currentRole != 'User');

        return true;
      } else {
        return false;
      }
    } on DioError catch (error) {
      if (error.response != null) {
        result = error.response!.data['message'];
      } else {}
      return false;
    }
  }
}
