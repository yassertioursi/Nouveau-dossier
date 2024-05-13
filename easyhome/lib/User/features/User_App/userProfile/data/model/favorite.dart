import 'package:json_annotation/json_annotation.dart';

part 'favorite.g.dart';

@JsonSerializable()
class Favorite {
  String? status;
  List<Workers>? workers;

  Favorite({this.status, this.workers});

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);
}

@JsonSerializable()
class Workers {
  Authentication? authentication;
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? email;
  String? profilePicture;
  String? wilaya;
  String? phoneNumber;
  int? reported;
  String? role;
  String? currentRole;
  String? job;
  String? idPicture;
  int? rating;
  int? experience;
  bool? isCertified;

  Workers(
      {this.authentication,
      this.id,
      this.name,
      this.email,
      this.profilePicture,
      this.wilaya,
      this.phoneNumber,
      this.reported,
      this.role,
      this.currentRole,
      this.job,
      this.idPicture,
      this.rating,
      this.experience,
      this.isCertified});

  factory Workers.fromJson(Map<String, dynamic> json) =>
      _$WorkersFromJson(json);

  Map<String, dynamic> toJson() => _$WorkersToJson(this);
}

@JsonSerializable()
class Authentication {
  bool? isVerified;

  Authentication({this.isVerified});

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}
