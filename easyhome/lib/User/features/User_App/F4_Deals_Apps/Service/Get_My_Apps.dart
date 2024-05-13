import 'package:dio/dio.dart';

class GetApps {
  Dio dio = Dio();
  List apps = [];

  Future<String> getApps(String jwtToken) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/applications/me/received";
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
        apps = response.data["data"];
        print(apps);

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
