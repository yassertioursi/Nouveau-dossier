import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';

part 'passwrod_state.dart';

class PasswrodCubit extends Cubit<PasswrodState> {
  final Repo repo;
  PasswrodCubit(this.repo) : super(PasswrodInitial());

  Future<void> emitUpdatePassword(Map<String, String> password) async {
    await repo.changePassword(password).then((userDetails) {
      emit(UpdatePassword(user: userDetails));
    });
  }
}
