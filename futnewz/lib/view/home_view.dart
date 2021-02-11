import 'package:flutter/material.dart';
import 'package:futnewz/widget/search_bar.dart';

import 'news_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SearchQAppbar(),
        NewsView(),
      ],
    );
  }
}
