import '../src/datasource.dart';

class PostsMapRepository {
  final PostsMapDataSource dataSource;

  PostsMapRepository(this.dataSource);

  Future<List<PostCard>> getPosts({
    required double lat,
    required double lng,
    required double radius,
    String? job,
  }) async {
    final response = await dataSource.getLocations(lat, lng, radius, job);

    return response.posts;
  }
}
