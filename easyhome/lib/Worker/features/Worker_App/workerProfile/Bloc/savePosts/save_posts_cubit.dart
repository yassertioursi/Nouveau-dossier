import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/saved_posts.dart';
import 'package:meta/meta.dart';

part 'save_posts_state.dart';

class SavePostsCubit extends Cubit<SavePostsState> {
  final Repo repo;
  SavePostsCubit(this.repo) : super(SavePostsInitial());

  final List<Datapost> posts = [];

  Future<void> emitGetSavedPosts(String id) async {
    emit(Loading());
    await repo.getSavedPosts(id).then((portfolio) {
      posts.addAll(portfolio.data!);
      emit(GetSavedPosts());
    });
  }

  Future<void> emitUnsavePost(Posts post) async {
    emit(Loading());
    await repo.unsavePost(post.id!).then((data) {
      posts.removeWhere((element) => element.post!.id == post.id);
      emit(UnsavePost());
    });
  }
}
