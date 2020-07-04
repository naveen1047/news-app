import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter/rendering.dart';
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
            //TODO: solve search issue
            actions: <Widget>[
              Builder(builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final result = await showSearch(
                          context: context, delegate: ArticleSearch());
                      print(result);
                    });
              }),
            ],
          ),
          body: BlocProvider(
            create: (context) => NewsBloc(newsApi: newsApi)
              ..add(FetchTopHeadlines(country: Country.ind)),
            child: HomeView(),
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
        return Center(child: CircularProgressIndicator());
      }
      if (state is TopHeadlineLoaded) {
        final articles = state.articles.articles;

        return CustomScrollView(
          slivers: <Widget>[
            //search feature
            SearchQAppbar(),
            SliverPadding(
              padding: kHomePadding,
              sliver: SliverGrid(
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
            ),
            SliverPadding(
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
                        print('object');
                      },
                    );
                  },
                  childCount: articles.length,
                ),
              ),
            ),
          ],
        );
      }
      if (state is TopHeadlineError) {
        return Center(
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
        );
      } else {
        return Text('Something wents wrong');
      }
    });
  }
}

class SearchQAppbar extends StatefulWidget {
  @override
  _SearchQAppbarState createState() => _SearchQAppbarState();
}

class _SearchQAppbarState extends State<SearchQAppbar> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'search "trendings"',
          border: InputBorder.none,
        ),
        onSubmitted: (text) {
          _sumitted(text);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _sumitted(searchController.text);
          },
        ),
      ],
    );
  }

  void _sumitted(String text) {
    print(text);
    if (text != null) {
      BlocProvider.of<NewsBloc>(context).add(FetchTopHeadlinesQ(q: text));
    }
    searchController.clear();
  }
}
