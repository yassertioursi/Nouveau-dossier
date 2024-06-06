part of 'source.dart';


class _CertificateResponse {
  final CertificateEntity certificate;

  _CertificateResponse({required this.certificate});

  factory _CertificateResponse.fromJson(Map<String, dynamic> json) {
    return _CertificateResponse(
      certificate: CertificateEntity.fromJson(json['certificate']),
    );
  }

  
}