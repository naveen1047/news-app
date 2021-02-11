import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:futnewz/widget/article_widget.dart';
import 'package:futnewz/widget/news_card.dart';

import '../constant.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is TopHeadlinesLoading) {
        return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()));
      }
      if (state is TopHeadlineLoaded) {
        final articles = state.articles.articles;

        return SliverPadding(
          padding: kHomePadding,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return NewsCard(
                  topPadding: index == 0 ? true : false,
                  image: articles[index].urlToImage,
                  title: articles[index].title,
                  description: articles[index].description,
                  website: articles[index].source.name,
                  author: articles[index].author,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ArticleView(article: articles[index])));
                    print('object');
                  },
                );
              },
              childCount: articles.length,
            ),
          ),
        );
      }
      if (state is TopHeadlineError) {
        return SliverToBoxAdapter(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('empty data'),
                FlatButton(
                    onPressed: () {
                      BlocProvider.of<NewsBloc>(context)
                          .add(FetchTopHeadlines(country: Country.ind));
                    },
                    child: Text('refresh')),
              ],
            ),
          ),
        );
      } else {
        return Text('Something wents wrong');
      }
    });
  }
}
