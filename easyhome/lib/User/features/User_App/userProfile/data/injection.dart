import 'package:dio/dio.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/password_Cubit/passwrod_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/update_cubit/update_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/services/web_services.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Certificate/certificate_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/cubit/worker_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/portfolio/portfolio_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/reviews/reviews_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/savePosts/save_posts_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// void initGetIt() {
//   getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
//   getIt.registerLazySingleton<Repo>(() => Repo(getIt()));
//   getIt.registerLazySingleton<WebServices>(
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

Future<void> initGetIt() async {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<UpdateCubit>(() => UpdateCubit(getIt()));
  getIt.registerLazySingleton<WorkerCubit>(() => WorkerCubit(getIt()));
  getIt.registerLazySingleton<PasswrodCubit>(() => PasswrodCubit(getIt()));
  getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit(getIt()));
  getIt.registerLazySingleton<PostCubit>(() => PostCubit(getIt()));
  getIt.registerLazySingleton<PortfolioCubit>(() => PortfolioCubit(getIt()));
  getIt.registerLazySingleton<ReviewsCubit>(() => ReviewsCubit(getIt()));
  getIt.registerLazySingleton<SavePostsCubit>(() => SavePostsCubit(getIt()));

  getIt.registerLazySingleton<SwitchCubit>(() => SwitchCubit(getIt()));
  getIt
      .registerLazySingleton<CertificateCubit>(() => CertificateCubit(getIt()));
  getIt.registerLazySingleton<Repo>(() => Repo(getIt()));
  getIt.registerLazySingleton<Dio>(() => Dioah.dio!);
  getIt.registerLazySingleton<WebServices>(() => WebServices(getIt()));
}

class Dioah {
  static Dio? dio;

  static init() {
    dio ??= Dio();
    dio!
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      // ..options.queryParameters.addAll({"posts": 1})
      ..options.headers.addAll({
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzgwNTc1YjBhOTVjMDUxYmI1ZTc4NiIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE1Mzg0MjIwLCJleHAiOjE3MjMxNjAyMjB9.674IskwKs5lBJfeJIAE_IwpYUPejHXFa6s7w7NNC0As",
      });

    dio!.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }
}
