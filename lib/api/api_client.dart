import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:xml2json/xml2json.dart';

import '../models/category.dart';

part 'api_client.g.dart';

class _Apis {
  static const String baseURL =
      'https://catalog.feedbooks.com/publicdomain/browse/';
  static const String popular = 'top.atom';
  static const String recent = 'recent.atom';
  static const String awards = 'awards.atom';
  static const String noteworthy = 'homepage_selection.atom';
  static const String shortStory = 'top.atom?cat=FBFIC029000';
  static const String sciFi = 'top.atom?cat=FBFIC028000';
  static const String actionAdventure = 'top.atom?cat=FBFIC002000';
  static const String mystery = 'top.atom?cat=FBFIC022000';
  static const String romance = 'top.atom?cat=FBFIC027000';
  static const String horror = 'top.atom?cat=FBFIC015000';
}

@RestApi(baseUrl: _Apis.baseURL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(_Apis.popular)
  Future<CategoryFeed> getPopular();

  @GET(_Apis.recent)
  Future<CategoryFeed> getRecent();

  @GET(_Apis.awards)
  Future<CategoryFeed> getAwards();

  @GET(_Apis.noteworthy)
  Future<CategoryFeed> getNoteworthy();

  @GET(_Apis.shortStory)
  Future<CategoryFeed> getShortStory();

  @GET(_Apis.sciFi)
  Future<CategoryFeed> getSciFi();

  @GET(_Apis.actionAdventure)
  Future<CategoryFeed> getActionAdventure();

  @GET(_Apis.mystery)
  Future<CategoryFeed> getMystery();

  @GET(_Apis.romance)
  Future<CategoryFeed> getRomance();

  @GET(_Apis.horror)
  Future<CategoryFeed> getHorror();
}
