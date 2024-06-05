import 'package:dio/dio.dart';
  import 'package:easyhome/Rechidi/core/injection/index.dart';

class CreateReview {
Dio dio = locator<Dio>();


  Future<bool> createReview(
      String jwtToken, String workerId, double rating, String review) async {
    String url = "https://easyhome-lcvx.onrender.com/api/v1/reviews/$workerId";

    Map data;
    if (review.isEmpty) {
      data = {"rating": rating};
    } else {
      data = {
        "rating": rating,
        "review": review,
      };
    }

    try {
      Response response = await dio.post(
        data: data,
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwtToken",
            "Content-Type": "application/json"
          },
        ),
      );
      print(response.statusCode);

      if (response.statusCode == 201) {
        print(response.data);

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
