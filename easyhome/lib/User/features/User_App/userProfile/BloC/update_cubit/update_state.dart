part of 'update_cubit.dart';

@immutable
sealed class UpdateState {}

final class UpdateInitial extends UpdateState {}

class UpdateUser extends UpdateState {
  late final User updatesUser;
  UpdateUser(updatedUser);
}
