import 'package:equatable/equatable.dart';

class CertificateEntity extends Equatable {
  final String? id;
  final String? title;
  final String? imageUrl;

  const CertificateEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory CertificateEntity.fromJson(Map<String, dynamic> json) {
    return CertificateEntity(
      id: json['_id'],
      title: json['title'],
      imageUrl: json['image'],
    );
  }

  @override
  List<Object?> get props => [id];
}
