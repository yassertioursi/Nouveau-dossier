// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'remove_favorite.g.dart';

@JsonSerializable()
class RemFav {
  String? status;
  String message;

  RemFav(
    this.status,
    this.message,
  );

  factory RemFav.fromJson(Map<String, dynamic> json) => _$RemFavFromJson(json);

  Map<String, dynamic> toJson() => _$RemFavToJson(this);
}
