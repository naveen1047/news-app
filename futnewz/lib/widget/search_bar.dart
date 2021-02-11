import 'package:flutter/material.dart';
import 'category_bar.dart';

class SearchQAppbar extends StatefulWidget {
  @override
  _SearchQAppbarState createState() => _SearchQAppbarState();
}

class _SearchQAppbarState extends State<SearchQAppbar> {
  CategoryBar categories;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          height: 55.0,
          child: CategoryBar(),
        ),
      ),
    );
  }
}
