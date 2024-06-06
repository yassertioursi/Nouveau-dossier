import 'package:bloc/bloc.dart';
import 'package:easyhome/Rechidi/models/woker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/certificate.dart';
import '../../../models/portfoliopost.dart';
import '../../../models/review.dart';
import '../data/repository/repository.dart';

part 'worker_profile_state.dart';
part 'worker_profile_cubit.freezed.dart';

class WorkerProfileCubit extends Cubit<WorkerProfileState> {
  WorkerProfileCubit(this._repository)
      : super(const WorkerProfileState.initial());
  final WorkerProfileRepository _repository;

  WorkerEntity? worker;
  final List<PortfolioPostEntity> portfolioPosts = [];
  final List<ReviewEntity> reviews = [];
  final List<CertificateEntity> certificates = [];
  int tabIndex = 0;

  void changeTab(int index) {
    emit(const WorkerProfileState.loading());
    tabIndex = index;
    emit(const WorkerProfileState.loaded());
  }

  void addCertificate(CertificateEntity? certificate) {
    emit(const WorkerProfileState.loading());
    if (certificate != null) certificates.add(certificate);
    emit(const WorkerProfileState.loaded());
  }

  void addPost(PortfolioPostEntity? post) {
    emit(const WorkerProfileState.loading());
    if (post != null) portfolioPosts.add(post);
    emit(const WorkerProfileState.loaded());
  }

  void replacePost(PortfolioPostEntity? post) {
    emit(const WorkerProfileState.loading());
    if (post != null) {
      final index =
          portfolioPosts.indexWhere((element) => element.id == post.id);
      if (index != -1) {
        portfolioPosts[index] = post;
      } else {
        portfolioPosts.add(post);
      }
    }
    emit(const WorkerProfileState.loaded());
  }

  Future<void> fetchPortfolioPosts() async {
    final id = worker!.id!;
    final page = portfolioPosts.length ~/ 15 + 1;

    emit(const WorkerProfileState.portfolioLoading());
    final posts = await _repository.getPortfolioPosts(id, page);
    portfolioPosts.addAll(posts);
    emit(const WorkerProfileState.portfolioLoaded());
  }

  Future<void> likePost(PortfolioPostEntity post) async {
    emit(const WorkerProfileState.likingPost());
    final id = post.id!;
    final counter = post.isLiked == true ? -1 : 1;
    post = post.copyWith(isLiked: !post.isLiked!, likes: post.likes! + counter);
    portfolioPosts[portfolioPosts.indexWhere((element) => element.id == id)] =
        post;

    await _repository.likePost(id);
    emit(const WorkerProfileState.likedPost());
  }

  Future<void> deletePost(PortfolioPostEntity post) async {
    emit(const WorkerProfileState.deletingPost());
    final id = post.id!;
    portfolioPosts.remove(post);
    await _repository.deletePost(id);
    emit(const WorkerProfileState.deletedPost());
  }

  Future<void> fetchReviews() async {
    final id = worker!.id!;
    final page = this.reviews.length ~/ 15 + 1;

    emit(const WorkerProfileState.fetchingReviews());
    final reviews = await _repository.getReviews(id, page);
    this.reviews.addAll(reviews);
    emit(const WorkerProfileState.reviewsFetched());
  }

  Future<void> deleteReview(ReviewEntity review) async {
    emit(const WorkerProfileState.deletingReview());
    final id = review.id!;
    reviews.remove(review);
    await _repository.deleteReview(id);
    emit(const WorkerProfileState.reviewDeleted());
  }

  Future<void> fetchCertificates() async {
    final id = worker!.id!;
    emit(const WorkerProfileState.fetchingCertificates());
    final certificates = await _repository.getCertificates(id);
    this.certificates.addAll(certificates);
    emit(const WorkerProfileState.certificatesFetched());
  }

  Future<void> deleteCertificate(CertificateEntity certificate) async {
    emit(const WorkerProfileState.deletingReview());
    final id = certificate.id!;
    certificates.remove(certificate);
    await _repository.deleteCertificate(id);
    emit(const WorkerProfileState.reviewDeleted());
  }

  Future<void> fetchProfile(String id) async {
    emit(const WorkerProfileState.fetchigProfile());
    worker = await _repository.getWorkerProfile(id);
    await fetchPortfolioPosts();
    await fetchReviews();
    await fetchCertificates();
    emit(const WorkerProfileState.profileFetched());
  }

  Future<void> switchAccount() async {
    emit(const WorkerProfileState.switchingAccount());
    await _repository.switchAccount();
    emit(const WorkerProfileState.accountSwitched());
  }
}
