part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchTopHeadlines extends NewsEvent {
  @override
  List<Object> get props => [];
}

class FetchNewsArticle extends NewsEvent {
  @override
  List<Object> get props => [];
}

class RefreshNews extends NewsEvent {
  @override
  List<Object> get props => [];
}
