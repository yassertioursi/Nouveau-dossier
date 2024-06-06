import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/module/editprofile/data/source/source.dart';
import 'package:easyhome/Rechidi/module/signupworker/data/repository.dart';
import 'package:easyhome/Rechidi/module/workerprofile/data/repository/repository.dart';
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

import '../../module/editprofile/data/repository/repository.dart';
import '../../module/signupworker/data/source.dart';
import '../../module/usermap/map/data/repo/repo.dart';
import '../../module/usermap/map/data/src/source.dart';
import '../../module/workermap/data/repository/repository.dart';
import '../../module/workermap/data/src/datasource.dart';
import '../../module/workerprofile/data/source/source.dart';
import '../helper/dio.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DioFactory.getDio());
  await SharedPrefHelper.init();

  locator.registerLazySingleton(() => WorkerSignUpWebService(locator<Dio>()));
  locator.registerLazySingleton(() => WorkerSignUpRepository(locator()));

  locator.registerLazySingleton(() => LocationDataSource(locator<Dio>()));
  locator.registerLazySingleton(() => LocationRepository(locator()));

  locator.registerLazySingleton(() => PostsMapDataSource(locator<Dio>()));
  locator.registerLazySingleton(() => PostsMapRepository(locator()));

  locator.registerLazySingleton(() => WorkerProfileDataSource(locator<Dio>()));
  locator.registerLazySingleton(() => WorkerProfileRepository(locator()));

  locator.registerLazySingleton(() => EditProfileDataSource(locator<Dio>()));
  locator.registerLazySingleton(() => EditProfileRepository(locator()));

  locator.registerLazySingleton<MyCubit>(() => MyCubit(locator()));
  locator.registerLazySingleton<UpdateCubit>(() => UpdateCubit(locator()));
  locator.registerLazySingleton<WorkerCubit>(() => WorkerCubit(locator()));
  locator.registerLazySingleton<PasswrodCubit>(() => PasswrodCubit(locator()));
  locator.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit(locator()));
  locator.registerLazySingleton<PostCubit>(() => PostCubit(locator()));
  locator
      .registerLazySingleton<PortfolioCubit>(() => PortfolioCubit(locator()));
  locator.registerLazySingleton<ReviewsCubit>(() => ReviewsCubit(locator()));
  locator
      .registerLazySingleton<SavePostsCubit>(() => SavePostsCubit(locator()));

  locator.registerLazySingleton<SwitchCubit>(() => SwitchCubit(locator()));
  locator.registerLazySingleton<CertificateCubit>(
      () => CertificateCubit(locator()));
  locator.registerLazySingleton<Repo>(() => Repo(locator()));
  locator.registerLazySingleton<WebServices>(() => WebServices(locator()));
}
