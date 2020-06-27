import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/bloc/news_bloc.dart';
import 'package:core/src/enums.dart';
import 'package:core/src/model/article.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewsApi extends Mock implements NewsApi {}

main() {
  final Source source = Source(
    id: 'mock',
    name: 'mock',
  );
  final Article article = Article(
    source: source,
    author: 'mock',
    title: 'mock',
    description: 'mock',
  );
  final Articles articles = Articles(
    status: 'ok',
    totalResults: 1,
    articles: [article],
  );

  group('news api', () {
    MockNewsApi newsApi;
    NewsBloc newsBloc;

    setUp(() {
      newsApi = MockNewsApi();
      newsBloc = NewsBloc(newsApi: newsApi);
    });

    tearDown(() {
      newsBloc?.close();
    });

    test('throws AssertionError when NewsApi is null', () {
      expect(() => NewsBloc(newsApi: null), throwsAssertionError);
    });

    test('has a correct initialState', () {
      expect(newsBloc.initialState, TopHeadlinesLoading());
    });

    group(
      'FetchNews',
      () {
        blocTest(
          'emits [TopHeadlineLoaded ] when NewsApi throws returns value',
          build: () async {
            when(newsApi.fetchTopHeadline(
              country: Country.ind,
            )).thenAnswer((_) => Future.value(articles));
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlines(country: Country.ind)),
          expect: [
            // NewsLoading(),
            TopHeadlineLoaded(articles: articles),
          ],
        );
        blocTest(
          'emits [QLoading, QLoaded ] when NewsApi throws returns value',
          build: () async {
            when(newsApi.fetchTopHeadlineQ(q: 'trump'))
                .thenAnswer((_) => Future.value(articles));
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlinesQ(q: 'trump')),
          expect: [
            QLoading(),
            QLoaded(articles: articles),
          ],
        );
        blocTest(
          'emits [SourceLoading, SourceLoaded ] when NewsApi throws returns value',
          build: () async {
            when(newsApi.fetchTopHeadlineSources(sources: 'cnn'))
                .thenAnswer((_) => Future.value(articles));
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlinesSources(sources: 'cnn')),
          expect: [
            SourceLoading(),
            SourceLoaded(articles: articles),
          ],
        );
        blocTest(
          'emits [TopheadineLoading, TopheadineError] when NewsApi throws error',
          build: () async {
            when(newsApi.fetchTopHeadline(country: Country.ind))
                .thenThrow('Newsapi error');
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlines(country: Country.us)),
          expect: [
            //list of states emmits error
            // NewsLoading(),
            TopHeadlineError(),
          ],
        );

        blocTest(
          'emits [TopheadineQLoading, TopheadineQError] when NewsApi throws error',
          build: () async {
            when(newsApi.fetchTopHeadlineQ(q: 'Covid'))
                .thenThrow('Newsapi error');
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlinesQ(q: 'Covid')),
          expect: [
            QLoading(),
            QError(),
          ],
        );

        blocTest(
          'emits [TopheadineSourceLoading, TopheadineSourceError] when NewsApi throws error',
          build: () async {
            when(newsApi.fetchTopHeadlineSources(sources: 'CNN'))
                .thenThrow('Newsapi error');
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlinesSources(sources: 'CNN')),
          expect: [
            SourceLoading(),
            SourceError(),
          ],
        );
      },
    );
  });
}
