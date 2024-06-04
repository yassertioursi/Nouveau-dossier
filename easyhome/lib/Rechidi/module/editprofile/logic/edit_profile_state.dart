part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.imagePicking() = _ImagePicking;
  const factory EditProfileState.imagePicked() = _ImagePicked;

  const factory EditProfileState.submitting() = _Submitting;
  const factory EditProfileState.submitted() = _Submitted;

  const factory EditProfileState.error(String message) = _Error;
}
