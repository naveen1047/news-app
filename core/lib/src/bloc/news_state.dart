part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsState {}

//TopHeadlines
class TopHeadlinesLoading extends NewsState {}

class TopHeadlineLoaded extends NewsState {
  final Articles articles;

  const TopHeadlineLoaded({@required this.articles}) : assert(articles != null);

  @override
  List<Object> get props => [articles.status, articles.articles.first.title];
}

class TopHeadlineError extends NewsState {}

//TopHeadlines q
class QLoading extends NewsState {}

class QLoaded extends NewsState {
  final Articles articles;

  const QLoaded({@required this.articles}) : assert(articles != null);

  @override
  List<Object> get props => [articles.status, articles.articles.first.title];
}

class QError extends NewsState {}

//TopHeadlines Source
class SourceLoading extends NewsState {}

class SourceLoaded extends NewsState {
  final Articles articles;

  const SourceLoaded({@required this.articles}) : assert(articles != null);

  @override
  List<Object> get props => [articles.status, articles.articles.first.title];
}

class SourceError extends NewsState {}




// class CategoryLoaded extends NewsState {
//   final Articles articles;

//   const CategoryLoaded({@required this.articles}) : assert(articles != null);

//   @override
//   List<Object> get props => [articles.status, articles.articles.first.title];
// }

