part of 'datasource.dart';

@JsonSerializable()
class _LocationResponse {
  _LocationResponse({
    this.posts = const [],
  });

  factory _LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  final List<PostCard> posts;

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}

@JsonSerializable()
class PostCard {
  final String title;
  final String description;
  final LocationEntity location;
  final UserEntity user;
  final  String id   ; 

  PostCard({
    required this.title,
    required this.description,
    required this.location,
    required this.user,
    required this.id,
  });

  factory PostCard.fromJson(Map<String, dynamic> json) =>
      _$PostCardFromJson(json);
  Map<String, dynamic> toJson() => _$PostCardToJson(this);
}
