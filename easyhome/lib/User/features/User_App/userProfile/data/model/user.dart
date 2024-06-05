import 'package:easyhome/User/features/User_App/userProfile/data/model/favorite.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? status;
  MyData? user;

  User({this.status, this.user});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class MyData {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  Authentication? authentication;
  String? facebook;
  String? email;
  String? bio;
  String? newEmail;
  String? profilePicture;
  String? wilaya;
  String? phoneNumber;
  int? reported;
  List<dynamic>? posts;
  List<dynamic>? favoriteWorkers;
  String? role;
  String? currentRole;

  MyData(
      {this.id,
      this.name,
      this.email,
      this.newEmail,
      this.profilePicture,
      this.wilaya,
      this.bio,
      this.phoneNumber,
      this.reported,
      this.posts,
      this.favoriteWorkers,
      this.role,
      this.currentRole,
      this.facebook});
  factory MyData.fromJson(Map<String, dynamic> json) => _$MyDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyDataToJson(this);
}
