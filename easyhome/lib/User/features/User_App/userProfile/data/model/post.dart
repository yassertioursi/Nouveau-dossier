import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  String? status;
  int? results;
  List<PData>? data;

  Post({this.status, this.results, this.data});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class PData {
  @JsonKey(name: "_id")
  String? id;
  PUser? user;
  String? title;
  String? description;
  List<String>? images;
  String? job;
  int? price;
  String? createdAt;
  String? updatedAt;

  PData(
      {this.id,
      this.user,
      this.title,
      this.description,
      this.images,
      this.job,
      this.price,
      this.createdAt,
      this.updatedAt});

  factory PData.fromJson(Map<String, dynamic> json) => _$PDataFromJson(json);

  Map<String, dynamic> toJson() => _$PDataToJson(this);
}

@JsonSerializable()
class PUser {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? profilePicture;
  String? wilaya;

  PUser({this.id, this.name, this.profilePicture, this.wilaya});

  factory PUser.fromJson(Map<String, dynamic> json) => _$PUserFromJson(json);

  Map<String, dynamic> toJson() => _$PUserToJson(this);
}
