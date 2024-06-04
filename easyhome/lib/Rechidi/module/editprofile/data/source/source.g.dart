// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _EditProfileDataSource implements EditProfileDataSource {
  _EditProfileDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://easyhome-lcvx.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> updateWorker(
    String name,
    String bio,
    String phoneNumber,
    String email,
    String facebook,
    String wilaya,
    String job,
    File? profilePicture,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'name',
      name,
    ));
    _data.fields.add(MapEntry(
      'bio',
      bio,
    ));
    _data.fields.add(MapEntry(
      'phone',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'facebook',
      facebook,
    ));
    _data.fields.add(MapEntry(
      'wilaya',
      wilaya,
    ));
    _data.fields.add(MapEntry(
      'job',
      job,
    ));
    if (profilePicture != null) {
      _data.files.add(MapEntry(
        'profilePicture',
        MultipartFile.fromFileSync(
          profilePicture.path,
          filename: profilePicture.path.split(Platform.pathSeparator).last,
          contentType: MediaType('image', 'jpeg'),
        ),
      ));
    }
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/api/v1/worker/update',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
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
