import 'package:dio/dio.dart';

class GetMeWorker {
  Dio dio = Dio();
  Map? worker;

  Future<String> getMeWorker(String jwtToken) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/workers/me";
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
        worker = response.data["worker"];

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
