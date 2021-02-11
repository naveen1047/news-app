import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futnewz/theme.dart';
import 'view/app_view.dart';

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
      // theme: ThemeData.dark(),
      theme: GalleryThemeData.darkThemeData,
      home: BlocProvider(
          create: (context) => NewsBloc(newsApi: newsApi)
            ..add(FetchTopHeadlines(country: Country.ind)),
          child: AppView(newsApi: newsApi)),
    );
  }
}
