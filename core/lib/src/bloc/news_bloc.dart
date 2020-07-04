import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/src/model/article.dart';
import 'package:core/src/networking/news_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../enums.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApi newsApi;

  NewsBloc({@required this.newsApi}) : assert(newsApi != null);

  Articles _topHeadline;
  Articles _q;
  Articles _sources;
  // Articles _category;

  @override
  NewsState get initialState => TopHeadlinesLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchTopHeadlines) {
      yield* _mapFetchTopHeadlinesToState(country: event.country);
    } else if (event is FetchTopHeadlinesQ) {
      yield* _mapFetchTopHeadlinesQToState(q: event.q);
    } else if (event is FetchTopHeadlinesSources) {
      yield* _mapFetchTopHeadlinesSourcesToState(sources: event.sources);
    }
  }

  //TODO: do caching
  Stream<NewsState> _mapFetchTopHeadlinesToState({Country country}) async* {
    yield TopHeadlinesLoading();
    try {
      if (_topHeadline == null) {
        _topHeadline = await newsApi.fetchTopHeadline(country: country);
        yield TopHeadlineLoaded(articles: _topHeadline);
      } else {
        yield TopHeadlineLoaded(articles: _topHeadline);
      }
    } catch (e) {
      print('exception: ${e.toString()}');
      yield TopHeadlineError();
    }
  }

  //TODO: implement correct state to return
  Stream<NewsState> _mapFetchTopHeadlinesQToState({String q}) async* {
    yield TopHeadlinesLoading();
    try {
      _q = await newsApi.fetchTopHeadlineQ(q: q);
      if (_q.totalResults > 0) {
        yield TopHeadlineLoaded(articles: _q);
      } else {
        throw('no result found');
      }
    } catch (e) {
      print('exception: ${e.toString()}');
      yield TopHeadlineError();
    }
  }

  Stream<NewsState> _mapFetchTopHeadlinesSourcesToState(
      {String sources}) async* {
    yield SourceLoading();
    try {
      _sources = await newsApi.fetchTopHeadlineSources(sources: sources);
      yield SourceLoaded(articles: _sources);
    } catch (e) {
      print('exception: ${e.toString()}');
      yield SourceError();
    }
  }
}
