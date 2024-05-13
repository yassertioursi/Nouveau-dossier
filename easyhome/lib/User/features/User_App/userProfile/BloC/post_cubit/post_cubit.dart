import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/post.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final Repo repo;
  PostCubit(this.repo) : super(PostInitial()) {
    emitGetPosts();
  }

  final List<PData> posts = [];

  Future<void> emitGetPosts() async {
    emit(Loading());
    await repo.getPosts().then((workersDetails) {
      posts.addAll(workersDetails.data!);
      emit(GetPosts());
    });
  }

  Future<void> emitDeletePost(PData post) async {
    emit(Loading());
    await repo.deletePost(post.id!).then((data) {
      posts.removeWhere((element) => element.id == post.id);
      emit(DeletePost());
    });
  }
}
