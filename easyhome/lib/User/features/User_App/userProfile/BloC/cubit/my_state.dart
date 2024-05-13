part of 'my_cubit.dart';

@immutable
sealed class MyState {}

class MyInitial extends MyState {}

class Loading extends MyState {}

class GetUserDetails extends MyState {
  late final User user;
  GetUserDetails({required this.user});
}
