import '../src/source.dart';

class LocationRepository {
  final LocationDataSource dataSource;

  LocationRepository(this.dataSource);

  Future<List<WorkerCard>> getLocations({
    required double lat,
    required double long,
    required double radius,
    required String? job,
  }) async {
    final result = await dataSource.getLocations(lat, long, radius, job);
    return result.workers!;
  }
}
