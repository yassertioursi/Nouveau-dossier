import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../../module/signupworker/data/source.dart';
import '../../module/usermap/map/data/repo/repo.dart';
import '../../module/usermap/map/data/src/source.dart';
import '../../module/workermap/data/repository/repository.dart';
import '../../module/workermap/data/src/datasource.dart';
import '../helper/dio.dart';


final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DioFactory.getDio());

  locator.registerLazySingleton(() => WorkerSignUpWebService(locator<Dio>()));

  locator.registerLazySingleton(() => LocationDataSource(locator<Dio>()));
  locator.registerLazySingleton(() => LocationRepository(locator()));

  locator.registerLazySingleton(() => PostsMapDataSource(locator<Dio>()));
  locator.registerLazySingleton(() => PostsMapRepository(locator()));
}
