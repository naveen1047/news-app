import 'package:core/src/bloc/news_bloc.dart';
import 'package:core/src/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('news event', () {
    group('Fetch topheadlines', () {
      test('props should return q', () {
        expect(FetchTopHeadlinesQ(q: 'uefa final').props, ['uefa final']);
      });
      test('props should return Sources', () {
        expect(FetchTopHeadlinesSources(sources: 'CNN').props, ['CNN']);
      });
      test('props should return country', () {
        expect(FetchTopHeadlines(country: Country.us).props,
            [Country.us]);
      });
    });

    group('Refresh news', () {
      test('props are [articles.status, articles.totalResults] equal', () {
        expect(FetchTopHeadlines().props, ['ok', 20]);
      });
    },skip: true);
  });
}
