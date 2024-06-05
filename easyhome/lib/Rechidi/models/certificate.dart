import 'package:equatable/equatable.dart';

class CertificateEntity extends Equatable {
  final String? id;
  final String? title;
  final String? imageUrl;
  final bool? isValid;

  const CertificateEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.isValid,
  });

  factory CertificateEntity.fromJson(Map<String, dynamic> json) {
    return CertificateEntity(
      id: json['_id'],
      title: json['title'],
      imageUrl: json['image'],
      isValid: json['isValid'],
    );
  }

  @override
  List<Object?> get props => [id];
}
