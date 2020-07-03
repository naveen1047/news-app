part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchTopHeadlines extends NewsEvent {
  final Country country;

  FetchTopHeadlines({
    @required this.country,
  }) : assert(country != null, 'param must not be null');
  @override
  List<Object> get props => [country];
}

class RefreshTopHeadlines extends NewsEvent {
  final Country country;

  RefreshTopHeadlines({
    this.country,
  }) : assert(country != null, 'param must not be null');
  @override
  List<Object> get props => [country];
}

class FetchTopHeadlinesQ extends NewsEvent {
  final String q;

  FetchTopHeadlinesQ({this.q}) : assert(q != null, 'q must not be null');
  @override
  List<Object> get props => [q];
}

class RefreshTopHeadlinesQ extends NewsEvent {
  final String q;

  RefreshTopHeadlinesQ({this.q}) : assert(q != null, 'q must not be null');
  @override
  List<Object> get props => [q];
}

class FetchTopHeadlinesSources extends NewsEvent {
  final String sources;

  FetchTopHeadlinesSources({this.sources})
      : assert(sources != null, 'sources must not be null');
  @override
  List<Object> get props => [sources];
}

class RefreshTopHeadlinesSources extends NewsEvent {
  final String sources;

  RefreshTopHeadlinesSources({this.sources})
      : assert(sources != null, 'sources must not be null');
  @override
  List<Object> get props => [sources];
}