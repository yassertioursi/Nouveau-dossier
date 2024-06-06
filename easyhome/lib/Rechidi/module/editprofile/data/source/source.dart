import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/core/helper/cache.dart';


part 'source.gd.dart';

abstract class EditProfileDataSource {
  factory EditProfileDataSource(Dio dio, {String baseUrl}) =
      _EditProfileDataSource;

  Future<void> updateWorker(
    String name,
    String bio,
    String phoneNumber,
    String email,
    String facebook,
    String wilaya,
    String job,
    File? profilePicture,
  );
}
