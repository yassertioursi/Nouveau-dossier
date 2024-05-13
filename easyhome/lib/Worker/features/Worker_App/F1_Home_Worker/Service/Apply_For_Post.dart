import 'package:dio/dio.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Home_Worker.dart';

class ApplyForPost {
  Dio dio = Dio();

  Future<bool> applyforPost(
      String jwtToken, String postId, String description) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/applications/$postId";
    Map data = {
      "description": description,
    };
    try {
      Response response = await dio.post(
        data: data,
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
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
