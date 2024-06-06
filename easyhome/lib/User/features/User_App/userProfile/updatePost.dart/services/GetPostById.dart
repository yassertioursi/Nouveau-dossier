import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetPost {
  Dio dio = locator<Dio>();

  Map? post;

  Future<String> getuser(String jwtToken, String idOfPost) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/users/posts/$idOfPost";

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
        post = response.data["post"];

        ;

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
