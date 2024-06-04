import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/src/media_type.dart';

part 'source.g.dart';

@RestApi(baseUrl: 'https://easyhome-lcvx.onrender.com')
abstract class EditProfileDataSource {
  factory EditProfileDataSource(Dio dio, {String baseUrl}) = _EditProfileDataSource;

  @POST('/api/v1/worker/update')
  @MultiPart()
  Future<void> updateWorker(
    @Part(name: 'name') String name,
    @Part(name: 'bio') String bio,
    @Part(name: 'phone') String phoneNumber,
    @Part(name: 'email') String email,
    @Part(name: 'facebook') String facebook,
    @Part(name: 'wilaya') String wilaya,
    @Part(name: 'job') String job,
    @Part(name: 'profilePicture') File? profilePicture,
  );
}
