import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  final Repo repo;
  SwitchCubit(this.repo) : super(SwitchInitial());

  Future<void> emitSwitche() async {
    emit(Loading());
    await repo.switche().then((token) {
      emit(Switche(switchDete: token));
    });
  }
}
