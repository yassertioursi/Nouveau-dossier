part of 'certifcate_crud_cubit.dart';

@freezed
class CertifcateCrudState with _$CertifcateCrudState {
  const factory CertifcateCrudState.initial() = _Initial;

  const factory CertifcateCrudState.loading() = _Loading;
  const factory CertifcateCrudState.loaded() = _Loaded;

  const factory CertifcateCrudState.saving() = _Saving;
  const factory CertifcateCrudState.saved(CertificateEntity x) = _Saved;

  const factory CertifcateCrudState.error(String message) = _Error;
}
