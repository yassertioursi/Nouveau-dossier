import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:flutter/material.dart';

part 'my_state.dart';
// part 'my_cubit.freezed.dart';

class MyCubit extends Cubit<MyState> {
  final Repo repo;
  MyCubit(this.repo) : super(MyInitial());

  Future<void> emitGetUserDetails(String userId) async {
    await repo.getUserById(userId).then((userDetails) {
      print(userDetails.user?.toJson());
      emit(GetUserDetails(user: userDetails));
    });
  }
}
