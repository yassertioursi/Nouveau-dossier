import 'package:bloc/bloc.dart';
import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/reviews.dart';
import 'package:meta/meta.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final Repo repo;
  ReviewsCubit(this.repo) : super(ReviewsInitial()) {
    emitGetReviewsByWorkerId(AuthCache.userId!);
  }

  final List<ReviewsData> reviews = [];

  Future<void> emitGetReviewsByWorkerId(String id) async {
    emit(Loading());
    await repo.getReviewsByWorkerId(id).then((posts) {
      reviews.addAll(posts.data!);
      emit(GetReviewsByWorkerId());
    });
  }
}
