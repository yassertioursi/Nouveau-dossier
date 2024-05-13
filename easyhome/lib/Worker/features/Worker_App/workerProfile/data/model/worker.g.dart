// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyWorker _$MyWorkerFromJson(Map<String, dynamic> json) => MyWorker(
      status: json['status'] as String?,
      worker: json['worker'] == null
          ? null
          : Worker.fromJson(json['worker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyWorkerToJson(MyWorker instance) => <String, dynamic>{
      'status': instance.status,
      'worker': instance.worker,
    };

Worker _$WorkerFromJson(Map<String, dynamic> json) => Worker(
      authentication: json['authentication'] == null
          ? null
          : Authentication.fromJson(
              json['authentication'] as Map<String, dynamic>),
      workerAccountVerified: json['workerAccountVerified'] as bool?,
      rating: (json['rating'] as num?)?.toInt(),
      ratingsNumber: (json['ratingsNumber'] as num?)?.toInt(),
      experience: (json['experience'] as num?)?.toInt(),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
      wilaya: json['wilaya'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      reported: (json['reported'] as num?)?.toInt(),
      role: json['role'] as String?,
      currentRole: json['currentRole'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: (json['iV'] as num?)?.toInt(),
      idPicture: json['idPicture'] as String?,
      bio: json['bio'] as String?,
      job: json['job'] as String?,
      isCertified: json['isCertified'] as bool?,
    );

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'authentication': instance.authentication,
      'workerAccountVerified': instance.workerAccountVerified,
      'rating': instance.rating,
      'ratingsNumber': instance.ratingsNumber,
      'experience': instance.experience,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'wilaya': instance.wilaya,
      'phoneNumber': instance.phoneNumber,
      'reported': instance.reported,
      'role': instance.role,
      'currentRole': instance.currentRole,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'idPicture': instance.idPicture,
      'job': instance.job,
      'bio': instance.bio,
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
