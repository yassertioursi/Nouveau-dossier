// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WorkerSignUpWebService implements WorkerSignUpWebService {
  _WorkerSignUpWebService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://easyhome-lcvx.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> signUpAsWorker({
    required double lat,
    required double long,
    required String job,
    required String title,
    required FileImage idPicture,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'lat',
      lat.toString(),
    ));
    _data.fields.add(MapEntry(
      'lng',
      long.toString(),
    ));
    _data.fields.add(MapEntry(
      'job',
      job,
    ));
    _data.fields.add(MapEntry(
      'title',
      title,
    ));

    _data.files.add(MapEntry(
        'idPicture',
        MultipartFile.fromFileSync(
          idPicture.file.path,
          filename: idPicture.file.path.split(Platform.pathSeparator).last,
          contentType: MediaType('image', 'jpeg'),
        )));

    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/v1/auth/signupAsWorker',
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
