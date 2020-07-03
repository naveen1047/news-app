import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futnewz/colors.dart';
import 'package:futnewz/constant.dart';
import 'package:futnewz/theme.dart';
import 'package:futnewz/widget/category_cards.dart';
import 'package:futnewz/widget/search.dart';
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
    final TextEditingController controller = TextEditingController();

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
              Builder(builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final result = await showSearch(
                          context: context,
                          delegate: ArticleSearch(controller));
                      print(result);
                    });
              }),
            ],
          ),
          body: Padding(
            padding: kHomePadding,
            child: BlocProvider(
              create: (context) => NewsBloc(newsApi: newsApi)
                ..add(FetchTopHeadlines(country: Country.ind)),
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
      if (state is TopHeadlinesLoading) {
        return CircularProgressIndicator();
      }
      if (state is TopHeadlineLoaded) {
        final articles = state.articles.articles;

        return CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kSpacing,
                crossAxisSpacing: kSpacing,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildListDelegate([
                CategoryCard(
                  image: 'assets/images/business.jpg',
                  title: 'Business',
                ),
                CategoryCard(
                  image: 'assets/images/entertainment.jpg',
                  title: 'Entertainment',
                ),
                CategoryCard(
                  image: 'assets/images/sports.jpg',
                  title: 'Sports',
                ),
                CategoryCard(
                  image: 'assets/images/general.jpg',
                  title: 'General',
                ),
                CategoryCard(
                  image: 'assets/images/science.jpg',
                  title: 'Science',
                ),
                CategoryCard(
                  image: 'assets/images/health.jpg',
                  title: 'Health',
                ),
                CategoryCard(
                  image: 'assets/images/technology.jpg',
                  title: 'Technology',
                ),
                
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return NewsCard(
                  topPadding: index == 0 ? true : false,
                  image: Image.network(
                    articles[index].urlToImage,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                  title: articles[index].title,
                  description: articles[index].description,
                  website: articles[index].source.name,
                  author: articles[index].author ?? '',
                  onTap: () {
                    print('object');
                  },
                );
              }),
            ),
          ],
        );
      }
      if (state is TopHeadlineError) {
        return Text('empty data');
      } else {
        return Text('Something wents wrong');
      }
    });
  }
}
