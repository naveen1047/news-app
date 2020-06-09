import 'package:flutter/material.dart';
import 'package:futnewz/theme.dart';

class NewsCard extends StatelessWidget {
  final Function onTap;
  final Image image;
  final String title;
  final String description;
  final String website;
  final String author;

  const NewsCard(
      {Key key,
      this.image,
      this.title,
      this.description,
      this.website,
      this.author,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            width: double.maxFinite,
            child: image,
          ),
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
            padding: ktopPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  website,
                  style: kDefaultText,
                ),
                Text(
                  author,
                  style: kDefaultText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
