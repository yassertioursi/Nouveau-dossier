import 'package:dio/dio.dart';

class DeclineApp {
  Dio dio = Dio();

  Future<String> declineApp(String jwtToken, String appId) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/applications/$appId/decline";
    try {
      Response response = await dio.delete(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );

      if (response.statusCode == 204) {
        print(response.data);

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
      return "false ";
    }
  }
}
