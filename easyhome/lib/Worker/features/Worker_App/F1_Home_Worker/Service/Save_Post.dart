import 'package:dio/dio.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Home_Worker.dart';

class SavePost {
  Dio dio = Dio();

  Future<bool> savePost(String jwtToken, String postId) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/users/posts/$postId/save";

    try {
      Response response = await dio.patch(
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
