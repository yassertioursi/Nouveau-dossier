// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReviewsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

ReviewsData _$ReviewsDataFromJson(Map<String, dynamic> json) => ReviewsData(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      worker: json['worker'] as String?,
      review: json['review'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ReviewsDataToJson(ReviewsData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'worker': instance.worker,
      'review': instance.review,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
    };
