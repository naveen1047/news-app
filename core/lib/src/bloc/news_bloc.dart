import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/src/model/article.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../enums.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApi newsApi;

  NewsBloc({@required this.newsApi}) : assert(newsApi != null);

  Articles _topHeadline;

  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchTopHeadlines) {
      yield* _mapFetchTopHeadlinesToState();
    } else if (event is FetchNewsArticle) {
    } else if (event is RefreshNews) {}
  }

  Stream<NewsState> _mapFetchTopHeadlinesToState() async* {
    yield NewsLoading();
    try {
      _topHeadline = await newsApi.fetchTopHeadline(country: Country.ind);
      yield NewsLoaded(articles: _topHeadline);
    } catch (_) {
      yield NewsError();
    }
  }
}
