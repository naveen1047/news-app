import 'package:flutter/material.dart';
import 'package:core/core.dart';

import '../constant.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('${article.source.name}'),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment.bottomRight,
                child: article.author != null
                    ? Text(
                        '${article.author}',
                        // style:
                        //     kDescription.copyWith(color: kWhiteBackgroundColor),
                      )
                    : Container(),
              ),
              titlePadding: const EdgeInsets.only(right: 12.0, bottom: 12.0),
              background: Image.network(
                article.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: kHomePadding,
              child: Column(
                children: [
                  Padding(
                    padding: ktopPadding,
                    child: Text(
                      '${article.title}',
                      // style: kTitle,
                    ),
                  ),
                  Padding(
                    padding: ktopPadding,
                    child: Text(
                      '${article.description}',
                      // style: kMutedTitle,
                    ),
                  ),
                  Padding(
                    padding: ktopPadding,
                    child: Text(
                      '${article.content}',
                      // style: kDescription,
                    ),
                  ),
                  Padding(
                    padding: ktopPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(Icons.access_time),
                            SizedBox(width: 4.0),
                            Text(
                              '${article.publishedAt}',
                            ),
                          ],
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.public,
                            ),
                            onPressed: () {
                              print(article.url);
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
