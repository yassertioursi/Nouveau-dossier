// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : MyData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
    };

MyData _$MyDataFromJson(Map<String, dynamic> json) => MyData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      newEmail: json['newEmail'] as String?,
      profilePicture: json['profilePicture'] as String?,
      wilaya: json['wilaya'] as String?,
      bio: json['bio'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      reported: (json['reported'] as num?)?.toInt(),
      posts: json['posts'] as List<dynamic>?,
      favoriteWorkers: json['favoriteWorkers'] as List<dynamic>?,
      role: json['role'] as String?,
      currentRole: json['currentRole'] as String?,
      facebook: json['facebook'] as String?,
    )..authentication = json['authentication'] == null
        ? null
        : Authentication.fromJson(
            json['authentication'] as Map<String, dynamic>);

Map<String, dynamic> _$MyDataToJson(MyData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'authentication': instance.authentication,
      'facebook': instance.facebook,
      'email': instance.email,
      'bio': instance.bio,
      'newEmail': instance.newEmail,
      'profilePicture': instance.profilePicture,
      'wilaya': instance.wilaya,
      'phoneNumber': instance.phoneNumber,
      'reported': instance.reported,
      'posts': instance.posts,
      'favoriteWorkers': instance.favoriteWorkers,
      'role': instance.role,
      'currentRole': instance.currentRole,
    };
