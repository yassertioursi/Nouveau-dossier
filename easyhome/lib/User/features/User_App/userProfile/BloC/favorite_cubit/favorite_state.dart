part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class GetFavoriteWorkers extends FavoriteState {}

class RemoveFavorite extends FavoriteState {}

class Loading extends FavoriteState {}
