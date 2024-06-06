// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PostDataSource implements PostDataSource {
  _PostDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://easyhome-lcvx.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<_PostResponse> createPost(
    String description,
    List<File> images,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};

    final _data = FormData.fromMap({
      'description': description,
      'images': [
        for (File x in images)
          await MultipartFile.fromFile(
            x.path,
            filename: x.path.split('/').last,
            contentType: MediaType('image', 'jpeg'),
          )
      ],
    });

    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<_PostResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/api/v1/workers/portfolioPosts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _PostResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<_PostResponse> updatePost(
    String id,
    String? description,
    List<String> removedImages,
    List<File> images,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};

    final _data = FormData.fromMap({
      'images': [
        for (File x in images)
          await MultipartFile.fromFile(
            x.path,
            filename: x.path.split('/').last,
            contentType: MediaType('image', 'jpeg'),
          )
      ],
      'removedPicturesUrls': removedImages,
      'description': description
    });

    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<_PostResponse>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/api/v1/workers/portfolioPosts/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _PostResponse.fromJson(_result.data!);
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
