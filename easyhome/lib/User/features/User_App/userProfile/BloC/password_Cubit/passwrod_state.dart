part of 'passwrod_cubit.dart';

sealed class PasswrodState {}

final class PasswrodInitial extends PasswrodState {}

class UpdatePassword extends PasswrodState {
  late final User user;
  UpdatePassword({required this.user});
}
