import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futnewz/widget/category_bar.dart';
import 'package:core/core.dart';

import 'home_view.dart';

class AppView extends StatefulWidget {
  final NewsApi newsApi;

  const AppView({Key key, this.newsApi}) : super(key: key);
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
                    hintText: 'go "trending\'s"',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (text) {
                    _submitted(text);
                  },
                )
              : Text(
                  'NEWS',
                  // style: kAppbarTitle,
                ),
          actions: <Widget>[
            isTyping
                ? IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      BlocProvider.of<NewsBloc>(context)
                          .add(FetchTopHeadlinesQ(q: searchController.text));
//                        _submitted(searchController.text);
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
        ),
        body: HomeView(),
      ),
    );
  }

  void _submitted(String text) {
    print(text);
    if (text != null) {
      BlocProvider.of<NewsBloc>(context).add(FetchTopHeadlinesQ(q: text));
    }
  }

  void _toggleSearch() {
    isTyping = !isTyping;
  }
}
