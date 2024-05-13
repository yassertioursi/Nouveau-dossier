// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) => Portfolio(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PortfolioData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortfolioToJson(Portfolio instance) => <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

PortfolioData _$PortfolioDataFromJson(Map<String, dynamic> json) =>
    PortfolioData(
      id: json['_id'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$PortfolioDataToJson(PortfolioData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'images': instance.images,
      'description': instance.description,
      'likes': instance.likes,
      'createdAt': instance.createdAt,
      'isLiked': instance.isLiked,
    };
