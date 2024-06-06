import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetCountNotification {
  Dio dio = locator<Dio>();

  int? mycount;

  Future<String> getmycount(String jwtToken) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/users/me/notificationsCount";

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
        mycount = response.data["count"];

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
