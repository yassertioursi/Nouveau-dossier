import 'package:easyhome/Rechidi/models/user.dart';

class WorkerEntity extends UserEntity {
  WorkerEntity({
    super.id,
    super.name,
    super.bio,
    this.job,
    super.willaya,
    super.profilePicture,
    this.rating,
    this.experience,
    super.phone,
    super.email,
    this.isCertified,
    super.facebook,
  });

  final String? job;
  final double? rating;
  final double? experience;
  final bool? isCertified;

  factory WorkerEntity.fromJson(Map<String, dynamic>? json) {
    json?['rating'] = _converter(json['rating']);
    json?['experience'] = _converter(json['experience']);

    return WorkerEntity(
      id: json?['_id'] as String?,
      name: json?['name'] as String?,
      bio: json?['bio'] as String?,
      job: json?['job'] as String?,
      willaya: json?['wilaya'] as String?,
      profilePicture: json?['profilePicture'] as String?,
      rating: json?['rating'],
      experience: json?['experience'],
      phone: json?['phoneNumber'] as String?,
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
