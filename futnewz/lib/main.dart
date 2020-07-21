import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futnewz/colors.dart';
import 'package:futnewz/constant.dart';
import 'package:futnewz/theme.dart';
import 'package:futnewz/widget/common_widgets.dart';
import 'widget/news_card.dart';

/*
  TODO:
  
  *task: 
  1. show lable i.e, category/search result,
  2. open article and read article
  3. do not reload whole app on new event
  
*/

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kWhiteBackgroundColor,
    // systemNavigationBarColor: kWhiteBackgroundColor,
  ));
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
      home: AppView(newsApi: newsApi),
    );
  }
}

class AppView extends StatefulWidget {
  final NewsApi newsApi;

  const AppView({Key key, this.newsApi}) : super(key: key);
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<StatelessWidget> _widgetOptions = <StatelessWidget>[
    HomeView(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    // Text(
    //   'Index 2: School',
    //   style: optionStyle,
    // ),
  ];
  static const List<BottomNavigationBarItem> _bottomItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('Refresh'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.refresh),
      title: Text('reload'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index != 2) {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: kWhiteBackgroundColor,
        //   leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //   title: Text(
        //     'NEWS',
        //     style: kAppbarTitle,
        //   ),
        //   //TODO: solve search issue
        //   actions: <Widget>[
        //     Builder(builder: (BuildContext context) {
        //       return IconButton(
        //           icon: Icon(Icons.search),
        //           onPressed: () async {
        //             final result = await showSearch(
        //                 context: context, delegate: ArticleSearch());
        //             print(result);
        //           });
        //     }),
        //   ],
        // ),
        body: BlocProvider(
          create: (context) => NewsBloc(newsApi: widget.newsApi)
            ..add(FetchTopHeadlines(country: Country.ind)),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: _bottomItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
            // CategoryChips(),
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
  bool isTyping = false;
  CategoryBar categories;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // floating: true,
      pinned: true,
      centerTitle: !isTyping,
      leading: isTyping
          ? IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _toggleSearch();
                });
              })
          : IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      title: isTyping
          ? TextField(
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'go "trendings"',
                border: InputBorder.none,
              ),
              onSubmitted: (text) {
                _sumitted(text);
              },
            )
          : Text(
              'NEWS',
              style: kAppbarTitle,
            ),
      actions: <Widget>[
        isTyping
            ? IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  _sumitted(searchController.text);
                },
              )
            : IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _toggleSearch();
                  });
                },
              ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: Container(
          height: 55.0,
          child: CategoryBar(),
        ),
      ),
    );
  }

  void _sumitted(String text) {
    print(text);
    if (text != null) {
      BlocProvider.of<NewsBloc>(context).add(FetchTopHeadlinesQ(q: text));
    }
  }

  void _toggleSearch() {
    isTyping = !isTyping;
  }
}

class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  List<Categories> category;
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List<Widget>.generate(
        Categories.values.length,
        (int index) {
          return ChoiceChip(
            label: Text(
              getCategory(Categories.values[index]),
            ),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
              BlocProvider.of<NewsBloc>(context).add(
                FetchTopHeadlinesCategory(categories: Categories.values[index]),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
