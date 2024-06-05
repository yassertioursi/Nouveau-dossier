part of 'worker_profile_cubit.dart';

@freezed
class WorkerProfileState with _$WorkerProfileState {
  const factory WorkerProfileState.initial() = _Initial;

  const factory WorkerProfileState.fetchigProfile() = _FetchingProfile;
  const factory WorkerProfileState.profileFetched() = _ProfileFetched;

  const factory WorkerProfileState.loading() = _Loading;
  const factory WorkerProfileState.loaded() = _Loaded;

  const factory WorkerProfileState.portfolioLoading() = _PortfolioLoading;
  const factory WorkerProfileState.portfolioLoaded() = _PortfolioLoaded;

  const factory WorkerProfileState.likingPost() = _LikingPost;
  const factory WorkerProfileState.likedPost() = _LikedPost;

  const factory WorkerProfileState.deletingPost() = _DeletingPost;
  const factory WorkerProfileState.deletedPost() = _DeletedPost;

  const factory WorkerProfileState.fetchingReviews() = _FetchingReviews;
  const factory WorkerProfileState.reviewsFetched() = _ReviewsFetched;

  const factory WorkerProfileState.fetchingCertificates() = _FetchingCertificates;
  const factory WorkerProfileState.certificatesFetched() = _CertificatesFetched;

  const factory WorkerProfileState.deletingReview() = _DeletingReview;
  const factory WorkerProfileState.reviewDeleted() = _ReviewDeleted;

  const factory WorkerProfileState.switchingAccount() = _SwitchingAccount;
  const factory WorkerProfileState.accountSwitched() = _AccountSwitched;

  const factory WorkerProfileState.error(String message) = _Error;
}
