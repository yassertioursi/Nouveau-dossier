import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';

class UserEntity {
  final String? id;
  final String? profilePicture;
  final String? name;
  final String? email;
  final String? bio;
  final String? willaya;
  final String? phone;
  final String? facebook;

  UserEntity({
    this.id,
    this.profilePicture,
    this.name,
    this.email,
    this.bio,
    this.willaya,
    this.phone,
    this.facebook,
  });

  factory UserEntity.fromJson(Map<String, dynamic>? json) {
    return UserEntity(
      id: json?['_id'],
      profilePicture: json?['profilePicture'],
      name: json?['name'],
      email: json?['email'],
      bio: json?['bio'],
      willaya: json?['wilaya'],
      phone: json?['phoneNumber'],
      facebook: json?['facebook'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'profilePicture': profilePicture,
      'name': name,
      'email': email,
      'bio': bio,
      'wilaya': willaya,
      'phoneNumber': phone,
      'facebook': facebook,
    };
  }

  factory UserEntity.fromUser(User x) {
    final user = x.user;
    return UserEntity(
      id: user?.id,
      profilePicture: user?.profilePicture,
      name: user?.name,
      email: user?.email,
      bio: user?.bio,
      willaya: user?.wilaya,
      phone: user?.phoneNumber,
      facebook: user?.facebook,
    );
  }
}
