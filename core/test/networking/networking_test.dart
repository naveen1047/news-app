import 'package:core/src/enums.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:test/test.dart';

void main() {
  test("parses article.json over a network", () async {
    final api = NewsApi();
    final topheadline = await api.fetchTopHeadline(country: Country.ind);
    final category = await api.fetchTopHeadlineCategory(
        country: Country.ind, category: Categories.business);
    final q = await api.fetchTopHeadlineQ(q: 'trump');
    final sources = await api.fetchTopHeadlineSources(sources: 'CNN');

    expect(topheadline.status, 'ok');
    expect(category.status, 'ok');
    expect(q.status, 'ok');
    expect(sources.status, 'ok');
  }, skip: false);
}
