part of 'certificate_cubit.dart';

@immutable
sealed class CertificateState {}

final class CertificateInitial extends CertificateState {}

final class GetCertificate extends CertificateState {}

final class Loading extends CertificateState {}

final class DeleteCertificate extends CertificateState {}
