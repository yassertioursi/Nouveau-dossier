import 'package:json_annotation/json_annotation.dart';

part 'certificate.g.dart';

@JsonSerializable()
class Certificate {
  String? status;
  List<Certificates>? certificates;

  Certificate({this.status, this.certificates});

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}

@JsonSerializable()
class Certificates {
  @JsonKey(name: "_id")
  String? id;
  String? title;
  String? image;
  bool? isValid;
  String? nAcceptedAt;
  String? createdAt;

  Certificates(
      {this.id,
      this.title,
      this.image,
      this.isValid,
      this.nAcceptedAt,
      this.createdAt});

  factory Certificates.fromJson(Map<String, dynamic> json) =>
      _$CertificatesFromJson(json);

  Map<String, dynamic> toJson() => _$CertificatesToJson(this);
}
