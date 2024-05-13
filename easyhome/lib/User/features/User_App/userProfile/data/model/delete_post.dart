import 'package:json_annotation/json_annotation.dart';

part 'delete_post.g.dart';

@JsonSerializable()
class Dpost {
  String? status;

  Dpost({this.status});

  factory Dpost.fromJson(Map<String, dynamic> json) => _$DpostFromJson(json);

  Map<String, dynamic> toJson() => _$DpostToJson(this);
}
