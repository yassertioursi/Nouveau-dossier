// void initGetIt() {
//   locator.registerLazySingleton<MyCubit>(() => MyCubit(locator()));
//   locator.registerLazySingleton<Repo>(() => Repo(locator()));
//   locator.registerLazySingleton<WebServices>(
//       () => WebServices(createAndSetupDio()));
// }

// Dio createAndSetupDio() {
//   Dio dio = Dio();
//   dio
//     ..options.connectTimeout = const Duration(seconds: 20)
//     ..options.receiveTimeout = const Duration(seconds: 20)
//     ..options.headers.addAll({
//       "Authorization":
//           "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzEzODgxMTM4LCJleHAiOjE3MjE2NTcxMzh9.qjUpC6zqEc-WWpga9M1H7zptWetIiBQ4BgHY4IW8xXo"
//     });

//   dio.interceptors.add(LogInterceptor(
//     responseBody: true,
//     error: true,
//     requestHeader: true,
//     responseHeader: false,
//     request: true,
//     requestBody: true,
//   ));
//   return dio;
// }

Future<void> initGetIt() async {}
