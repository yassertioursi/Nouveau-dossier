import 'package:dio/dio.dart';

class GetUser {
  Dio dio = Dio();

  Map? user;

  Future<String> getuser(String jwtToken, String idOfUser) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/users/$idOfUser";

    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );

      if (response.statusCode == 200) {
        print("----------------${response.data}---------------");
        user = response.data["user"];

        return "true";
      } else {
        print(false);
        return "false";
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print('Error Response data: ${error.response!.data}');
        print('Error Response status: ${error.response!.statusCode}');
        print('Error Response headers: ${error.response!.headers}');
      } else {
        print('Error: $error');
      }
      return "false";
    }
  }
}
