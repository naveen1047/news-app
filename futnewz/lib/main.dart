import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futnewz/colors.dart';
import 'package:futnewz/constant.dart';
import 'package:futnewz/theme.dart';
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
      theme: theme,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: kWhiteBackgroundColor,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            title: Text(
              'NEWS',
              style: kAppbarTitle,
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          ),
          body: Padding(
            padding: kHomePadding,
            child: BlocProvider(
              create: (context) => NewsBloc(newsApi: newsApi)..add(FetchTopHeadlines()),
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
              website: articles[index].source.name,
              author: articles[index].author ?? '',
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
