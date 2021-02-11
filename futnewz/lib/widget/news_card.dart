import 'package:flutter/material.dart';
import 'package:futnewz/theme.dart';

import '../constant.dart';

class NewsCard extends StatelessWidget {
  final Function onTap;
  final String image;
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
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          title != null
              ? Padding(
                  padding: ktopPadding,
                  child: Text(
                    title,
                  ),
                )
              : Container(),
          description != null
              ? Padding(
                  padding: ktopPadding,
                  child: Text(
                    description,
                    // style: kDescription,
                  ),
                )
              : Container(),
          Padding(
            padding: ktopPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                website != null
                    ? Row(
                        children: <Widget>[
                          Icon(Icons.public),
                          SizedBox(width: 4.0),
                          Text(
                            website,
                          ),
                        ],
                      )
                    : Container(),
                author != null
                    ? Flexible(
                        child: Text(
                          author,
                          // style: kDefaultText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: kVerticalPadding,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
