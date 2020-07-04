import 'package:flutter/material.dart';

class ArticleSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
    // var results = articles
    //     .where((a) => a.title.toLowerCase().contains(query.toLowerCase()));

    // return ListView(
    //   children: results
    //       .map<ListTile>((a) => ListTile(
    //             title: Text(a.title,
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .subhead
    //                     .copyWith(fontSize: 16.0)),
    //             leading: Icon(Icons.book),
    //             onTap: () async {
    //               if (await canLaunch(a.url)) {
    //                 await launch(a.url);
    //               }
    //               close(context, a);
    //             },
    //           ))
    //       .toList(),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Container();
    return ListTile(
      // onTap: controller.text,
    );
    // final results = articles
    //     .where((a) => a.title.toLowerCase().contains(query.toLowerCase()));

    // return ListView(
    //   children: results
    //       .map<ListTile>((a) => ListTile(
    //             title: Text(a.title,
    //                 style: Theme.of(context).textTheme.subhead.copyWith(
    //                       fontSize: 16.0,
    //                       color: Colors.blue,
    //                     )),
    //             onTap: () {
    //               close(context, a);
    //             },
    //           ))
    //       .toList(),
    // );
  }
}
