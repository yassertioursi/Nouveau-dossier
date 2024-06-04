import 'package:easyhome/Rechidi/core/helper/date.formater.dart';

class PortfolioPostEntity {
  PortfolioPostEntity({
    this.images = const [],
    this.description,
    this.isLiked,
    required DateTime? createdAt,
    this.likes = 0,
    this.id,
  }) : _createdAt = createdAt;

  final String? id;
  final List<String> images;
  final String? description;
  final bool? isLiked;
  final DateTime? _createdAt;
  final int? likes;

  String get createdAt => _createdAt!.ddMONyyyy;

  factory PortfolioPostEntity.fromJson(Map<String, dynamic>? json) {
    return PortfolioPostEntity(
      images: List<String>.from(json?['images']),
      description: json?['description'],
      isLiked: json?['isLiked'],
      createdAt: DateTime.parse(json?['createdAt']),
      likes: json?['likes'],
      id: json?['_id'],
    );
  }

  PortfolioPostEntity copyWith({
    String? id,
    List<String>? images,
    String? description,
    bool? isLiked,
    DateTime? createdAt,
    int? likes,
  }) {
    return PortfolioPostEntity(
      id: id ?? this.id,
      images: images ?? this.images,
      description: description ?? this.description,
      isLiked: isLiked ?? this.isLiked,
      createdAt: createdAt ?? _createdAt,
      likes: likes ?? this.likes,
    );
  }
}
