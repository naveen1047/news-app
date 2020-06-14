import 'package:core/src/model/article.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('article', () {
    final articles = Articles(status: 'ok', totalResults: 20, articles: []);
    final source = Source(id: null, name: "New York Times");
    final article = Article(
      source: source,
      author: 'mock namc',
      title: 'mock title',
    );

    test('articles prop are equal', () {
      expect(articles.props, ['ok', 20, []]);
    });

    test('article prop are equal', () {
      expect(article.props.take(3), [
        source,
        'mock namc',
        'mock title',
      ]);
    });

    test('fromJson should return correct data', () {
      final json = {
        "source": {"id": null, "name": "New York Times"},
        "author": null,
        "title":
            "Watch Live: George Floyd Funeral in Houston Today - The New York Times",
        "description":
            "The death of George Floyd galvanized a movement, as cities from New York to Los Angeles consider changes to police funding. Loved ones are remembering him as a man who wanted to “touch the world.”",
        "url":
            "https://www.nytimes.com/2020/06/09/us/george-floyd-funeral-protests.html",
        "urlToImage":
            "https://static01.nyt.com/images/2020/06/10/video/09-floyd-funeral/merlin_173361735_e9c24045-a120-4d7f-94f7-dcad2f47e6a7-facebookJumbo.jpg",
        "publishedAt": "2020-06-09T18:43:15Z",
        "content":
            "In what has become a morning routine, Lorraine Bates walks the seven-tenths of a mile to City Hall from her house in Petal, Miss. In the first days of demonstrations, she joined some 200 other protes… [+1700 chars]"
      };

      final actual = Article.fromJson(json);

      expect(actual.author, null);
      expect(actual.title,
          "Watch Live: George Floyd Funeral in Houston Today - The New York Times");
    });
  });
}
