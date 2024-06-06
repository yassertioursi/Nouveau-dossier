import 'dart:io';

import 'package:easyhome/Rechidi/models/certificate.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/src/media_type.dart';

part 'response.dart';
part 'source.g.dart';

@RestApi(baseUrl: "https://easyhome-lcvx.onrender.com")
abstract class CertificateSource {
  factory CertificateSource(Dio dio, {String baseUrl}) = _CertificateSource;

  @POST("/api/v1/workers/certificates/")
  @MultiPart()
  Future<_CertificateResponse> createCertificate(
    @Part(name: "title") String title,
    @Part(name: 'certificate') File certificate,
  );
}
