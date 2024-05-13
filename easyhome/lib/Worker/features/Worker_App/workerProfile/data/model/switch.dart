import 'package:json_annotation/json_annotation.dart';

part 'switch.g.dart';

@JsonSerializable()
class Switch {
  String? status;
  String? token;
  Switch(
    this.status,
    this.token,
  );
  factory Switch.fromJson(Map<String, dynamic> json) => _$SwitchFromJson(json);

  Map<String, dynamic> toJson() => _$SwitchToJson(this);
}
