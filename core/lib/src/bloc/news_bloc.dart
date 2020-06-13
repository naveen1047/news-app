import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/src/model/article.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApi newsApi;

  NewsBloc({@required this.newsApi}) : assert(newsApi != null);

  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchNews) {
      yield* _mapFetchNewsToState();
    } else if (event is FetchNewsArticle) {
    } else if (event is RefreshNews) {}
  }

  Stream<NewsState> _mapFetchNewsToState() async* {
    yield NewsLoading();
    try {
      final articles = await newsApi.fetchArticle();
      yield NewsLoaded(articles: articles);
    } catch (_) {
      yield NewsError();
    }
  }
}
