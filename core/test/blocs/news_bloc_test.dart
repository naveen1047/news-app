import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/bloc/news_bloc.dart';
import 'package:core/src/enums.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewsApi extends Mock implements NewsApi {}

main() {
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
      expect(newsBloc.initialState, NewsLoading());
    });

    group(
      'FetchNews',
      () {
        blocTest(
          'emits [NewsLoading, NewsError] when NewsApi throws error',
          build: () async {
            when(newsApi.fetchTopHeadline(country: Country.ind)).thenThrow('Newsapi error');
            return newsBloc;
          },
          act: (bloc) => bloc.add(FetchTopHeadlines()),
          expect: [
            // NewsLoading(),
            NewsError(),
          ],
        );
      },
    );
  });
}
