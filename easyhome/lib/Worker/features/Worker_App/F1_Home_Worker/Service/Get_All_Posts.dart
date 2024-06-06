import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetAllPosts {
  Dio dio = locator<Dio>();

  List? posts;

  Future<String> getAllPosts(String jwtToken, String url) async {
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
        posts = response.data["data"];
        print(posts);

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
