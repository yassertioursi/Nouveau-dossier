import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/favorite.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final Repo repo;
  FavoriteCubit(this.repo) : super(FavoriteInitial()) {
    emitGetFavorite();
  }

  final List<Workers> workers = [];
  Future<void> emitGetFavorite() async {
    emit(Loading());
    await repo.getFavoriteWorkers().then((workersDetails) {
      workers.addAll(workersDetails.workers!);
      emit(GetFavoriteWorkers());
    });
  }

  Future<void> removeFav(Workers worker) async {
    emit(Loading());
    await repo.removeFav(worker.id!).then((data) {
      workers.removeWhere((element) => element.id == worker.id);
      emit(RemoveFavorite());
    });
  }
}
