import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class DeleteApp {
Dio dio = locator<Dio>();


  Future<bool> deleteApp(String jwtToken, String appId) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/applications/$appId";

    try {
      Response response = await dio.delete(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );

      print(response.statusCode);
      if (response.statusCode == 204) {
        ;
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
