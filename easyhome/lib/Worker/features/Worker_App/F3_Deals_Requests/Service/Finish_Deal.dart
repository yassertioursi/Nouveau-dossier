import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class FinishDeal {
Dio dio = locator<Dio>();

  String? status;

  Future<bool> finishDeal(String jwtToken, String dealId) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/deals/$dealId/finishRequest";
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
        print(response.data["deal"]);
        status = response.data["deal"]["status"];

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
