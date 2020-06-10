import 'package:core/src/networking/news_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("parses article.json over a network", () async {
    final api = NewsApi();
    final articles = await api.fetchArticle();
    
    expect(articles.status, 'ok');
  }, skip: false);
}
