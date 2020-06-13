// import 'package:core/src/bloc/news_bloc.dart';
// import 'package:core/src/model/article.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('news event', () {
//     final articles = Articles(status: 'ok', totalResults: 20, articles: []);
//     final article = Article(
//       source: {"id": null, "name": "New York Times"},
//       author: 'mock namc',
//       title: 'mock title',
//     );

//     group('Fetch Articles', () {
//       test('props are [articles.status, articles.totalResults] equal', () {
//         expect(FetchNews(articles: articles).props, ['ok', 20]);
//       });
//     });

//     group('Fetch Article', () {
//       test('props are [articles.status, articles.totalResults] equal', () {
//         expect(FetchNewsArticle(article: article).props, [
//           'mock namc',
//           'mock title',
//         ]);
//       });
//     });

//     group('Refresh news', () {
//       test('props are [articles.status, articles.totalResults] equal', () {
//         expect(RefreshNews(articles: articles).props, ['ok', 20]);
//       });
//     });
//   });
// }
