import 'package:dio/dio.dart';

Dio dio = Dio();

class Search {
  String? getUrl;
  List? workers;

  Future<String> search_workers(String jwtToken) async {
    try {
      Response response = await dio.get(
        getUrl!,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );
      if (response.statusCode == 200) {
        print("true ");
        print(response.data);
        workers = response.data["workers"];
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
