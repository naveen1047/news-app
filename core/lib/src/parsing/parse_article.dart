import 'package:core/src/model/article.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '38d5f5f271214ffdbc60a8837ff8bd7e';

Future<Articles> fetchArticle() async {
  final response = await http
      .get('https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');

  if (response.statusCode == 200) {
    return Articles.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
