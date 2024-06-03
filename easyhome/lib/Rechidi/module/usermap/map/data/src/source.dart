import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


import '../../../../../models/location.dart';

part 'source.done.dart';
part 'response.dart';

abstract class LocationDataSource {
  factory LocationDataSource(Dio dio, {String baseUrl}) = _LocationDataSource;

  Future<LocationResponse> getLocations(
    double lat,
    double lng,
    double radius,
    String? job,
  );
}
