part of 'post_cubit.dart';

sealed class PostState {}

final class PostInitial extends PostState {}

class GetPosts extends PostState {}

class DeletePost extends PostState {}

class Loading extends PostState {}
