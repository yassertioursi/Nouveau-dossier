// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      workers: (json['workers'] as List<dynamic>?)
          ?.map((e) => WorkerCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'workers': instance.workers,
    };

WorkerCard _$WorkerCardFromJson(Map<String, dynamic> json) {
  if (json['location']['lat'].runtimeType == int ||
      json['location']['lng'].runtimeType == int) {
    json['location']['lat'] = json['location']['lat'] =
        json['location']['lat'] = json['location']['lat'].toDouble() / 100;
    json['location']['lng'] = json['location']['lng'] =
        json['location']['lng'] = json['location']['lng'].toDouble() / 100;
  }

  return WorkerCard(
    location: json['location'] == null
        ? null
        : LocationEntity.fromJson({
            ...json['location'] as Map<String, dynamic>,
            'subTitle': json['job'] as String,
          }),
    name: json['name'] as String?,
    job: json['job'] as String?,
    image: json['profilePicture'] as String?,
  );
}

Map<String, dynamic> _$WorkerCardToJson(WorkerCard instance) =>
    <String, dynamic>{
      'location': instance.location?.toJson(),
      'name': instance.name,
      'job': instance.job,
      'profilePicture': instance.image,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LocationDataSource implements LocationDataSource {
  _LocationDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://easyhome-lcvx.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LocationResponse> getLocations(
    double lat,
    double lng,
    double radius,
    String? job,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': lat,
      r'lng': lng,
      r'diameter': radius,
      r'job': job,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LocationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/users/map/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LocationResponse.fromJson(_result.data!);
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
