import 'package:core/src/enums.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:test/test.dart';

void main() {
  final api = NewsApi();

  test("parses article.json over a network", () async {
    final topheadline = await api.fetchTopHeadline(country: Country.ind);
    expect(topheadline.status, 'ok');
  });

  test("parses article.json over a network", () async {
    final category = await api.fetchTopHeadlineCategory(
        country: Country.ind, category: Categories.business);
    expect(category.status, 'ok');
  });

   test("parses article.json over a network", () async {
    final q = await api.fetchTopHeadlineQ(q: 'trump');
    expect(q.status, 'ok');
  });

   test("parses article.json over a network", () async {
    final sources = await api.fetchTopHeadlineSources(sources: 'CNN');
    expect(sources.status, 'ok');
  });
}
