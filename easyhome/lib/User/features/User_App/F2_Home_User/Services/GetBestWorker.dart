import 'package:dio/dio.dart';
import 'package:easyhome/Models/Worker_Model.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetBestWorkers {
  Dio dio = locator<Dio>();

  List? bestWorkers;
  Future<String> getbestworkers(String jwtToken) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/workers/bestWorkers?limit=10,fields=rating,experience,name,ratingsNumber";

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
        bestWorkers = response.data["bestWorkers"];

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
