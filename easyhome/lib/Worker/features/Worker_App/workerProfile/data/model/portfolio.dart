import 'package:json_annotation/json_annotation.dart';

part 'portfolio.g.dart';

@JsonSerializable()
class Portfolio {
  String? status;
  int? results;
  List<PortfolioData>? data;

  Portfolio({this.status, this.results, this.data});
  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioToJson(this);
}

@JsonSerializable()
class PortfolioData {
  @JsonKey(name: "_id")
  String? id;
  List<String>? images;
  String? description;
  int? likes;
  String? createdAt;
  bool? isLiked;
  PortfolioData(
      {this.id,
      this.images,
      this.description,
      this.likes,
      this.createdAt,
      this.isLiked});

  factory PortfolioData.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDataFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioDataToJson(this);
}
