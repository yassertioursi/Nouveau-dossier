part of 'posts_map_cubit.dart';

@freezed
class PostsMapState with _$PostsMapState {
  const factory PostsMapState.initial() = _Initial;

  const factory PostsMapState.loading() = _Loading;
  const factory PostsMapState.loaded() = _Loaded;

  const factory PostsMapState.fetchingPosts() = _FetchingPosts;
  const factory PostsMapState.fetchingPostsSuccess() = _FetchingPostsSuccess;
}
