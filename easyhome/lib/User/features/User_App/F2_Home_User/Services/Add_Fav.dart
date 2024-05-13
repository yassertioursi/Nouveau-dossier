import 'package:dio/dio.dart';

class AddFav {
  Dio dio = Dio();

  Future<bool> addFav(String jwtToken, String idOfWorker) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/workers/$idOfWorker/favorite";

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
