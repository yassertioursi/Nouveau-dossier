// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedPost _$SavedPostFromJson(Map<String, dynamic> json) => SavedPost(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datapost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedPostToJson(SavedPost instance) => <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

Datapost _$DatapostFromJson(Map<String, dynamic> json) => Datapost(
      post: json['post'] == null
          ? null
          : Posts.fromJson(json['post'] as Map<String, dynamic>),
      application: json['application'] == null
          ? null
          : Application.fromJson(json['application'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatapostToJson(Datapost instance) => <String, dynamic>{
      'post': instance.post,
      'application': instance.application,
    };

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
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
      selectedWorkers: (json['selectedWorkers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'job': instance.job,
      'price': instance.price,
      'selectedWorkers': instance.selectedWorkers,
      'createdAt': instance.createdAt,
    };

PUser _$PUserFromJson(Map<String, dynamic> json) => PUser(
      id: json['_id'] as String?,
      profilePicture: json['profilePicture'] as String?,
      wilaya: json['wilaya'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PUserToJson(PUser instance) => <String, dynamic>{
      '_id': instance.id,
      'profilePicture': instance.profilePicture,
      'wilaya': instance.wilaya,
      'name': instance.name,
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: json['id'] as String?,
      applied: json['applied'] as bool?,
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applied': instance.applied,
    };
