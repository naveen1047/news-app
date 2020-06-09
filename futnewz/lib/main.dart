import 'package:flutter/material.dart';

import 'widget/news_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            child: ListView(
              children: <Widget>[
                NewsCard(
                  image: Image.asset(
                    'assets/images/match_1.jpg',
                    fit: BoxFit.cover,
                  ),
                  title: 'Excepteur sint occaecat cupidatat non proident.',
                  description:
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est eopksio laborum.',
                  website: 'website',
                  author: 'author',
                  onTap: () {
                    print('object');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
