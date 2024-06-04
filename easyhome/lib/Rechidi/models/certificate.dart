class CertificateEntity {
  final String? id;
  final String? title;
  final String? imageUrl;

  CertificateEntity({
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
}
