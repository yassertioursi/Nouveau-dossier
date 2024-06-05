import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class UpdateDeal {
Dio dio = locator<Dio>();


  Future<String> updateDealtitle(
      String jwtToken, String DealId, String title) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/deals/$DealId";
    try {
      Response response = await dio.patch(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
        data: {"title": title},
      );

      if (response.statusCode == 200) {
        print(response.data);

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

  Future<String> updateDealdesc(
      String jwtToken, String DealId, String desc) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/deals/$DealId";
    try {
      Response response = await dio.patch(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
        data: {"description": desc},
      );

      if (response.statusCode == 200) {
        print("Success");

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

  Future<String> updateDealstatus(
      String jwtToken, String DealId, String status) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/deals/$DealId";
    try {
      Response response = await dio.patch(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
        data: {"status": status},
      );

      if (response.statusCode == 200) {
        print("Success");

        return "true";
      } else {
        print("Fail");
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
