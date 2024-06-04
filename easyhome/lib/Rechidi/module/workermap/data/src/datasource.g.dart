// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    _LocationResponse(
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => PostCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LocationResponseToJson(_LocationResponse instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };

PostCard _$PostCardFromJson(Map<String, dynamic> json) => PostCard(
      title: json['title'] as String,
      description: json['description'] as String,
      location:
          LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostCardToJson(PostCard instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PostsMapDataSource implements PostsMapDataSource {
  _PostsMapDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://easyhome-lcvx.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<_LocationResponse> getLocations(
    double lat,
    double lng,
    double radius,
    String? job,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': lat,
      r'lng': lng,
      r'radius': radius,
      r'job': job,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<_LocationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/users/posts/map',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _LocationResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
