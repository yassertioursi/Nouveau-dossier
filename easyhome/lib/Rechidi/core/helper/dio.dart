import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 60);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.contentType = Headers.formUrlEncodedContentType
        ..options.headers.addAll({
          "Accept": "*/*",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NWFkYWQ2Mjk0NjA5ZmJmNGU2NmMxMiIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNzIzMDM4MywiZXhwIjoxNzI1MDA2MzgzfQ.yPENcwf0aZFf_b6yImKMKEeXBx_FzWjyapOPjWB0_yE"
        });
      addDioInterceptor();
    }
    return dio!;
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
