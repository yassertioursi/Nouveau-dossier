import 'package:easyhome/Rechidi/core/helper/date.formater.dart';
import 'package:easyhome/Rechidi/models/user.dart';

class ReviewEntity {
  ReviewEntity(
      {required this.id,
      required this.rating,
      required this.review,
      required this.user,
      DateTime? createdAt})
      : _createdAt = createdAt;

  final String? id;
  final num? rating;
  final UserEntity? user;
  final String? review;
  final DateTime? _createdAt;

  String get date => _createdAt!.ddMONyyyy;

  factory ReviewEntity.fromJson(Map<String, dynamic> json) {
    return ReviewEntity(
      id: json['_id'],
      rating: json['rating'],
      user: UserEntity.fromJson(json['user']),
      review: json["review"] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
