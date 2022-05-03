// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://catalog.feedbooks.com/publicdomain/browse/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CategoryFeed> getPopular() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getRecent() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recent.atom',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getAwards() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'awards.atom',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getNoteworthy() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'homepage_selection.atom',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getShortStory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom?cat=FBFIC029000',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getSciFi() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom?cat=FBFIC028000',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getActionAdventure() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom?cat=FBFIC002000',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getMystery() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom?cat=FBFIC022000',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getRomance() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom?cat=FBFIC027000',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
  }

  @override
  Future<CategoryFeed> getHorror() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryFeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.atom?cat=FBFIC015000',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if (_result.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_result.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_result.statusCode}');
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
}
