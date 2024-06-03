part of 'sign_up_worker_cubit.dart';

@freezed
class SignUpWorkerState with _$SignUpWorkerState {
  const factory SignUpWorkerState.initial() = _Initial;

  const factory SignUpWorkerState.selectingJob() = _SelectingJob;
  const factory SignUpWorkerState.selectedJob() = _SelectedJob;

  const factory SignUpWorkerState.uploadingID() = _SelectingPicId;
  const factory SignUpWorkerState.uploadedID() = _SelectedPicId;

  const factory SignUpWorkerState.selectingLocation() = _SelectingLocation;
  const factory SignUpWorkerState.selectedLocation() = _SelectedLocation;

  const factory SignUpWorkerState.submitting() = _Submitting;
  const factory SignUpWorkerState.submitted() = _Submitted;

  const factory SignUpWorkerState.error(String message) = _Error;
}
