import 'package:dio/dio.dart';
import 'package:easyhome/Rechidi/models/woker.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../models/certificate.dart';
import '../../../../models/portfoliopost.dart';
import '../../../../models/review.dart';

part 'response.dart';
part 'source.g.dart';

@RestApi(baseUrl: "https://easyhome-lcvx.onrender.com")
abstract class WorkerProfileDataSource {
  factory WorkerProfileDataSource(Dio dio, {String baseUrl}) =
      _WorkerProfileDataSource;

  @GET("/api/v1/workers/{id}")
  Future<_WorkerResponse> getProfile(
    @Path("id") String id,
  );

  @GET("/api/v1/workers/{id}/portfolioPosts")
  Future<_PortfolioPostResponse> getPortfolioPost(
    @Path("id") String id,
    @Query("page") int page, {
    @Query("limit") int limit = 15,
  });

  @PATCH("/api/v1/workers/portfolioPosts/{id}/like")
  Future<void> like(
    @Path("id") String id,
  );

  @DELETE("/api/v1/workers/portfolioPosts/{id}")
  Future<void> delete(
    @Path("id") String id,
  );

  @GET("/api/v1/workers/{id}/reviews")
  Future<_ReviewResponse> getReviews(
    @Path("id") String id,
    @Query("page") int page, {
    @Query("limit") int limit = 15,
    }
  );

   @DELETE("/api/v1/reviews/{id}")
  Future<void> deleteReview(
    @Path("id") String id,
  );

  @GET("/api/v1/workers/{id}/certificates")
  Future<_CertificateResponse> getCertificates(
    @Path("id") String id,
  );

  @DELETE("/api/v1/workers/certificates")
  Future<void> deleteCertificate(
    @Path("id") String id,
  );










}
