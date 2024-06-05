import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetDeals {
Dio dio = locator<Dio>();

  List deals = [];

  Future<String> getDeals(String jwtToken) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/deals/me";
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
        deals = response.data["data"];
        print(deals);

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
