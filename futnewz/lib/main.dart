import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/news_card.dart';

void main() {
  final NewsApi newsApi = NewsApi();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp(
    newsApi: newsApi,
  ));
}

class MyApp extends StatelessWidget {
  final NewsApi newsApi;

  const MyApp({Key key, this.newsApi})
      : assert(newsApi != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            title: Text('NEWS'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (context) => NewsBloc(newsApi: newsApi)..add(FetchNews()),
              child: HomeView(),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return CircularProgressIndicator();
      }
      if (state is NewsLoaded) {
        final articles = state.articles.articles;

        return ListView.builder(
          itemCount: state.articles.articles.length,
          itemBuilder: (BuildContext context, int index) {
            return NewsCard(
              image: Image.network(
                articles[index].urlToImage,
                fit: BoxFit.cover,
              ),
              title: articles[index].title,
              description: articles[index].description,
              website: articles[index].source['name'],
              author: articles[index].author?? '',
              onTap: () {
                print('object');
              },
            );
          },
        );
      }
      if (state is NewsError) {
        return Text('empty data');
      } else {
        return Text('Something wents wrong');
      }
    });
  }
}

//  children: <Widget>[
//             NewsCard(
//               image: Image.asset(
//                 'assets/images/match_1.jpg',
//                 fit: BoxFit.cover,
//               ),
//               title: 'Excepteur sint occaecat cupidatat non proident.',
//               description:
//                   'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est eopksio laborum.',
//               website: 'website',
//               author: 'author',
//               onTap: () {
//                 print('object');
//               },
//             ),
//           ],
