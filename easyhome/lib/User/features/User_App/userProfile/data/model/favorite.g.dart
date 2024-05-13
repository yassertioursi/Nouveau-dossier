// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
      status: json['status'] as String?,
      workers: (json['workers'] as List<dynamic>?)
          ?.map((e) => Workers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
      'status': instance.status,
      'workers': instance.workers,
    };

Workers _$WorkersFromJson(Map<String, dynamic> json) => Workers(
      authentication: json['authentication'] == null
          ? null
          : Authentication.fromJson(
              json['authentication'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
      wilaya: json['wilaya'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      reported: (json['reported'] as num?)?.toInt(),
      role: json['role'] as String?,
      currentRole: json['currentRole'] as String?,
      job: json['job'] as String?,
      idPicture: json['idPicture'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      experience: (json['experience'] as num?)?.toInt(),
      isCertified: json['isCertified'] as bool?,
    );

Map<String, dynamic> _$WorkersToJson(Workers instance) => <String, dynamic>{
      'authentication': instance.authentication,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'wilaya': instance.wilaya,
      'phoneNumber': instance.phoneNumber,
      'reported': instance.reported,
      'role': instance.role,
      'currentRole': instance.currentRole,
      'job': instance.job,
      'idPicture': instance.idPicture,
      'rating': instance.rating,
      'experience': instance.experience,
      'isCertified': instance.isCertified,
    };

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) =>
    Authentication(
      isVerified: json['isVerified'] as bool?,
    );

Map<String, dynamic> _$AuthenticationToJson(Authentication instance) =>
    <String, dynamic>{
      'isVerified': instance.isVerified,
    };
