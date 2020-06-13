part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final Articles articles;

  const NewsLoaded({@required this.articles}) : assert(articles != null);

  @override
  List<Object> get props => [articles.status, articles.articles.first.title];
}

class NewsError extends NewsState {}
