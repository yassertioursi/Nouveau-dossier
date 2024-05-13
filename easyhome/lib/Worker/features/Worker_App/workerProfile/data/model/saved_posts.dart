import 'package:json_annotation/json_annotation.dart';

part 'saved_posts.g.dart';

@JsonSerializable()
class SavedPost {
  String? status;
  int? results;
  List<Datapost>? data;

  SavedPost({this.status, this.results, this.data});
  factory SavedPost.fromJson(Map<String, dynamic> json) =>
      _$SavedPostFromJson(json);

  Map<String, dynamic> toJson() => _$SavedPostToJson(this);
}

@JsonSerializable()
class Datapost {
  Posts? post;
  Application? application;

  Datapost({this.post, this.application});
  factory Datapost.fromJson(Map<String, dynamic> json) =>
      _$DatapostFromJson(json);

  Map<String, dynamic> toJson() => _$DatapostToJson(this);
}

@JsonSerializable()
class Posts {
  @JsonKey(name: '_id')
  String? id;
  PUser? user;
  String? title;
  String? description;
  List<String>? images;
  String? job;
  int? price;
  List<String>? selectedWorkers;
  String? createdAt;

  Posts({
    this.id,
    this.user,
    this.title,
    this.description,
    this.images,
    this.job,
    this.price,
    this.selectedWorkers,
    this.createdAt,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);

  Map<String, dynamic> toJson() => _$PostsToJson(this);
}

@JsonSerializable()
class PUser {
  @JsonKey(name: '_id')
  String? id;
  String? profilePicture;
  String? wilaya;
  String? name;

  PUser({this.id, this.profilePicture, this.wilaya, this.name});
  factory PUser.fromJson(Map<String, dynamic> json) => _$PUserFromJson(json);

  Map<String, dynamic> toJson() => _$PUserToJson(this);
}

@JsonSerializable()
class Application {
  String? id;
  bool? applied;

  Application({this.id, this.applied});

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
