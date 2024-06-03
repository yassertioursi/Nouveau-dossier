import 'package:flutter/cupertino.dart';

import '../../../models/location.dart';
import 'source.dart';

class WorkerSignUpRepository {
  final WorkerSignUpWebService dataSource;

  WorkerSignUpRepository(this.dataSource);

  Future<void> signUpWorker(WorkerSignUpRequest request) async {
    return await dataSource.signUpAsWorker(
      lat: request.location.latitude,
      long: request.location.longitude,
      job: request.job,
      title: request.location.title,
      idPicture: request.idPic,
    );
  }
}

class WorkerSignUpRequest {
  final String job;
  final FileImage idPic;
  final LocationEntity location;

  WorkerSignUpRequest({
    required this.job,
    required this.idPic,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      "job": job,
      ...location.toJson(),
    };
  }
}

class WorkerSignUpResponse {}
