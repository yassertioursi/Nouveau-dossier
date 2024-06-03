import 'package:easyhome/Rechidi/models/location.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'response.dart';
part 'datasource.g.dart';

@RestApi(baseUrl: "https://easyhome-lcvx.onrender.com")
abstract class PostsMapDataSource {
  factory PostsMapDataSource(Dio dio, {String baseUrl}) = _PostsMapDataSource;

  @GET("/api/v1/users/posts/map")
  Future<_LocationResponse> getLocations(
    @Query("lat") double lat,
    @Query("lng") double lng,
    @Query("radius") double radius,
    @Query("job") String? job,
  );
}
