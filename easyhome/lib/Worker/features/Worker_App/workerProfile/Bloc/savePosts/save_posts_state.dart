part of 'save_posts_cubit.dart';

@immutable
sealed class SavePostsState {}

final class SavePostsInitial extends SavePostsState {}

final class GetSavedPosts extends SavePostsState {}

final class Loading extends SavePostsState {}

final class UnsavePost extends SavePostsState {}
