import 'dart:io';

import 'package:easyhome/Rechidi/models/certificate.dart';
import 'package:easyhome/Rechidi/models/portfoliopost.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/src/media_type.dart';

part 'response.dart';
part 'source.done.dart';

abstract class PostDataSource {
  factory PostDataSource(Dio dio, {String baseUrl}) = _PostDataSource;

  Future<_PostResponse> createPost(
    String description,
    List<File> images,
  );

  Future<_PostResponse> updatePost(
    String id,
    String? description,
    List<String> removedImages,
    List<File> images,
  );
}
