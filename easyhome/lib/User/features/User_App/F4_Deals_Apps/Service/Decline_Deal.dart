import 'package:dio/dio.dart';

class DeclineDeal {
  Dio dio = Dio();
  String? status;

  Future<String> declineDeal(String jwtToken, String dealId) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/deals/$dealId/finishDecline";
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
