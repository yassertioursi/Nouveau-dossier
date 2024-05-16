import 'package:dio/dio.dart';

class SendRequest {
  Dio dio = Dio();

  Future<bool> sendRequest(
      String jwtToken, String idOfPost, List<String> selectedWorkers) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/users/posts/$idOfPost";

    try {
      Response response = await dio.patch(
        data: {
          "selectedWorkers": selectedWorkers,
        },
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);

        return true;
      } else {
        print(false);
        return false;
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print('Error Response data: ${error.response!.data}');
        print('Error Response status: ${error.response!.statusCode}');
        print('Error Response headers: ${error.response!.headers}');
      } else {
        print('Error: $error');
      }
      return false;
    }
  }
}
