import 'package:json_annotation/json_annotation.dart';

part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  String? status;
  int? results;
  List<ReviewsData>? data;

  Reviews({this.status, this.results, this.data});

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}

@JsonSerializable()
class ReviewsData {
  @JsonKey(name: '_id')
  String? id;
  String? user;
  String? worker;
  String? review;
  double? rating;
  String? createdAt;

  ReviewsData({
    this.id,
    this.user,
    this.worker,
    this.review,
    this.rating,
    this.createdAt,
  });
  factory ReviewsData.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsDataToJson(this);
}
