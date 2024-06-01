import 'package:dio/dio.dart';

class GetMyRequests {
  Dio dio = Dio();
  List? requests;

  Future<String> getMyRequests(String jwtToken) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/workers/me/requests";
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
        print(response.data);
        requests = response.data["data"];
        print(requests);

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
