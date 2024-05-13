// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificate _$CertificateFromJson(Map<String, dynamic> json) => Certificate(
      status: json['status'] as String?,
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => Certificates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'status': instance.status,
      'certificates': instance.certificates,
    };

Certificates _$CertificatesFromJson(Map<String, dynamic> json) => Certificates(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      isValid: json['isValid'] as bool?,
      nAcceptedAt: json['nAcceptedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CertificatesToJson(Certificates instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'isValid': instance.isValid,
      'nAcceptedAt': instance.nAcceptedAt,
      'createdAt': instance.createdAt,
    };
