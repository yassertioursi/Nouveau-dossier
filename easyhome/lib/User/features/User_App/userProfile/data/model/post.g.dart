// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

PData _$PDataFromJson(Map<String, dynamic> json) => PData(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : PUser.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      job: json['job'] as String?,
      price: (json['price'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PDataToJson(PData instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'job': instance.job,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

PUser _$PUserFromJson(Map<String, dynamic> json) => PUser(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profilePicture'] as String?,
      wilaya: json['wilaya'] as String?,
    );

Map<String, dynamic> _$PUserToJson(PUser instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'wilaya': instance.wilaya,
    };
