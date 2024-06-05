import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class UpdatePostService {
Dio dio = locator<Dio>();


  Future<bool> updatePost(
    String title,
    String price,
    String description,
    String job,
    String postId,
    String jwtToken,
  ) async {
    String postUrl =
        'https://easyhome-lcvx.onrender.com/api/v1/users/posts/$postId';

    dio.options.headers['Authorization'] = 'Bearer $jwtToken';

    Map data = {
      "title": title,
      "description": description,
      "job": job,
      "price": price,
    };

    try {
      Response response = await dio.patch(postUrl, data: data);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return true;
      } else {
        print("Error: ${response.statusCode}");
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
