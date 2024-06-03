import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';

part 'source.gdone.dart';

abstract class WorkerSignUpWebService {
  factory WorkerSignUpWebService(Dio dio, {String baseUrl}) =
      _WorkerSignUpWebService;

  Future<void> signUpAsWorker({
    required double lat,
    required double long,
    required String job,
    required String title,
    required FileImage idPicture,
  });
}
