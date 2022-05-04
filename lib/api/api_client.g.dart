// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient({this.baseUrl}) {
    baseUrl ??= 'https://catalog.feedbooks.com/publicdomain/browse/';
  }

  final Dio _dio = Dio(BaseOptions(connectTimeout: 5000));

  String? baseUrl;

  @override
  Future<CategoryFeed> getPopular() async {
    final _res = await _dio.get(baseUrl! + 'top.atom').catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getRecent() async {
    final _res = await _dio.get(baseUrl! + 'recent.atom').catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getAwards() async {
    final _res = await _dio.get(baseUrl! + 'awards.atom').catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getNoteworthy() async {
    final _res = await _dio
        .get(baseUrl! + 'homepage_selection.atom')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getShortStory() async {
    final _res = await _dio
        .get(baseUrl! + 'top.atom?cat=FBFIC029000')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getSciFi() async {
    final _res = await _dio
        .get(baseUrl! + 'top.atom?cat=FBFIC028000')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getActionAdventure() async {
    final _res = await _dio
        .get(baseUrl! + 'top.atom?cat=FBFIC002000')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getMystery() async {
    final _res = await _dio
        .get(baseUrl! + 'top.atom?cat=FBFIC022000')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getRomance() async {
    final _res = await _dio
        .get(baseUrl! + 'top.atom?cat=FBFIC027000')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getHorror() async {
    final _res = await _dio
        .get(baseUrl! + 'top.atom?cat=FBFIC015000')
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }

  @override
  Future<CategoryFeed> getCustomApi(link) async {
    final _res = await _dio
        .get(link)
        .catchError((onError) {
      Future.error(onError);
    });
    if (_res.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(_res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      final value = CategoryFeed.fromJson(json);
      return value;
    }
    return Future.error('Error ${_res.statusCode}');
  }
}
