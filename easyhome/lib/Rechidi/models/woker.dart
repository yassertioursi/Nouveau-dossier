import 'package:easyhome/Rechidi/models/user.dart';

class WorkerEntity extends UserEntity {
  WorkerEntity({
    super.id,
    super.name,
    this.bio,
    this.job,
    this.wilaya,
    super.profilePicture,
    this.rating,
    this.experience,
    this.phoneNumber,
    this.email,
    this.isCertified,
    this.facebook,
  });


  final String? bio;
  final String? job;
  final String? wilaya;
  final double? rating;
  final double? experience;
  final String? phoneNumber;
  final String? email;
  final bool? isCertified;
  final String? facebook;
  

  factory WorkerEntity.fromJson(Map<String, dynamic>? json) {
    json?['rating'] = _converter(json['rating']);
    json?['experience'] = _converter(json['experience']);

    return WorkerEntity(
      id: json?['_id'] as String?,
      name: json?['name'] as String?,
      bio: json?['bio'] as String?,
      job: json?['job'] as String?,
      wilaya: json?['wilaya'] as String?,
      profilePicture: json?['profilePicture'] as String?,
      rating: json?['rating'],
      experience: json?['experience'],
      phoneNumber: json?['phoneNumber'] as String?,
      email: json?['email'] as String?,
      isCertified: json?['isCertified'] as bool?,
      facebook: json?['facebook'] as String?,
    );
  }
}

double? _converter(x) {
  if (x.runtimeType == int) {
    return (x as int).toDouble();
  } else {
    return x as double?;
  }
}
