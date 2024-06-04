import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';

class UserEntity {
  final String? id;
  final String? profilePicture;
  final String? name;
  final String? email;
  final String? bio;
  final String? wilaya;
  final String? phoneNumber;
  final String? facebook;

  UserEntity({
    this.id,
    this.profilePicture,
    this.name,
    this.email,
    this.bio,
    this.wilaya,
    this.phoneNumber,
    this.facebook,
  });

  factory UserEntity.fromJson(Map<String, dynamic>? json) {
    return UserEntity(
      id: json?['_id'],
      profilePicture: json?['profilePicture'],
      name: json?['name'],
      email: json?['email'],
      bio: json?['bio'],
      wilaya: json?['wilaya'],
      phoneNumber: json?['phoneNumber'],
      facebook: json?['facebook'],
    );
  }

  factory UserEntity.fromUser(User x) {
    final user = x.data;
    return UserEntity(
      id: user?.id,
      profilePicture: user?.profilePicture,
      name: user?.name,
      email: user?.email,
      bio: user?.bio,
      wilaya: user?.wilaya,
      phoneNumber: user?.phoneNumber,
      facebook: user?.facebook,
    );
  }
}
