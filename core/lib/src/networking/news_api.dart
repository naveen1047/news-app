import 'package:core/src/enums.dart';
import 'package:core/src/model/article.dart';
import 'package:core/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  static final String apiKey = '38d5f5f271214ffdbc60a8837ff8bd7e';

  ///Country can't mix this param with the sources param.
  Future<Articles> fetchTopHeadline({
    @required Country country,
  }) async {
    final String reg = getCountry(country);
    final String url =
        'https://newsapi.org/v2/top-headlines?country=$reg&apiKey=$apiKey';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load article:country');
    }
  }

  ///Sources can't mix this param with the country or category params.
  Future<Articles> fetchTopHeadlineSources({
    @required String sources,
  }) async {
    final String url =
        'https://newsapi.org/v2/top-headlines?sources=$sources&apiKey=$apiKey';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load article:sources');
    }
  }

  ///Category can't mix this param with the sources param.
  Future<Articles> fetchTopHeadlineCategory(
      {@required Categories category, @required Country country}) async {
    final String cat = getCategory(category);
    final String reg = getCountry(country);
    final String url =
        'https://newsapi.org/v2/top-headlines?country=$reg&category=$cat&apiKey=$apiKey';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load article:category');
    }
  }

  Future<Articles> fetchTopHeadlineQ({
    @required String q,
  }) async {
    final String url =
        'https://newsapi.org/v2/top-headlines?q=$q&apiKey=$apiKey';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load article:q');
    }
  }
}
