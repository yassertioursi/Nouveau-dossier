import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:flutter/material.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  final Repo repo;
  UpdateCubit(this.repo) : super(UpdateInitial());

  Future<void> emitUpdateUser(
      String userID, Map<String, String> newUser) async {
    await repo.updateUser(userID, newUser).then((updatedUser) {
      emit(UpdateUser(updatedUser));
    });
  }
}
