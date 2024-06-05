import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetNotification {
Dio dio = locator<Dio>();

  List? notifications;

  Future<String> getmynotifications(String jwtToken) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/users/me/notifications";

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
        notifications = response.data["data"];

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
