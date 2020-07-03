import 'package:flutter/material.dart';
import 'package:futnewz/theme.dart';

import '../constant.dart';

class NewsCard extends StatelessWidget {
  final Function onTap;
  final Image image;
  final String title;
  final String description;
  final String website;
  final String author;
  final bool topPadding;

  const NewsCard(
      {Key key,
      this.image,
      this.title,
      this.description,
      this.website,
      this.author,
      this.onTap,
      this.topPadding = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          image != null
              ? Container(
                  padding: topPadding ? ktopPadding : null,
                  height: 200.0,
                  width: double.maxFinite,
                  child: image,
                )
              : Container(),
          Padding(
            padding: ktopPadding,
            child: Text(title, style: kTitle),
          ),
          Padding(
            padding: ktopPadding,
            child: Text(
              description,
              style: kDescription,
            ),
          ),
          Padding(
            padding: kBottomDoubledPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.public),
                    SizedBox(width: 4.0),
                    Text(
                      website,
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    author,
                    // style: kDefaultText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
