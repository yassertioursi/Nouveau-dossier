part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class GetReviewsByWorkerId extends ReviewsState {}

final class Loading extends ReviewsState {}
