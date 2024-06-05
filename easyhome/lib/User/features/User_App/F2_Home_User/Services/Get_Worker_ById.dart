import 'package:dio/dio.dart';
import 'package:easyhome/Models/Worker_Model.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class GetWorker {
Dio dio = locator<Dio>();

  late bool isFav;

  WorkerYasser? worker;
  Future<String> getworker(String jwtToken, String idOfWorker) async {
    String url =
        "https://easyhome-lcvx.onrender.com/api/v1/workers/$idOfWorker";

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
        this.worker = WorkerYasser.fromJson(response.data["worker"]);

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
