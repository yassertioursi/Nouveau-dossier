import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';

class CreateDeal {
  Dio dio = locator<Dio>();

  Future<bool> createDeal(
      String jwtToken, String appId, String title, String description) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/deals/$appId";
    Map data = {
      "title": title,
      "description": description,
    };
    try {
      Response response = await dio.post(
        url,
        data: data,
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
