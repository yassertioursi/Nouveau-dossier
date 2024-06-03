import 'package:json_annotation/json_annotation.dart';

class WorkerEntity {
  WorkerEntity({
    this.id,
    this.name,
    this.bio,
    this.job,
    this.wilaya,
    this.profilePicture,
    this.rating,
    this.experience,
    this.phoneNumber,
    this.email,
    this.isCertified,
    this.facebook,
  });

  final String? id;
  final String? name;
  final String? bio;
  final String? job;
  final String? wilaya;
  final String? profilePicture;
  final double? rating;
  final double? experience;
  final String? phoneNumber;
  final String? email;
  final bool? isCertified;
  final String? facebook;

  factory WorkerEntity.fromJson(Map<String, dynamic> json) => WorkerEntity(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        bio: json['bio'] as String?,
        job: json['job'] as String?,
        wilaya: json['wilaya'] as String?,
        profilePicture: json['profilePicture'] as String?,
        rating: json['rating'] as double?,
        experience: json['experience'] as double?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        isCertified: json['isCertified'] as bool?,
        facebook: json['facebook'] as String?,
      );
}
