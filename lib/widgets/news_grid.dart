import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_news_app/screens/news_article_detail_screen.dart';
import 'package:mvvm_news_app/viewmodels/news_article_viewmodel.dart';
import 'package:mvvm_news_app/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel>? articles;

  const NewsGrid({Key? key, this.articles}) : super(key: key);

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(
        article: article,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles?[index];
        return GestureDetector(
          onTap: () {
           
           _showNewsArticleDetails(context, article!);
          },
          child: GridTile(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: CircleImage(
                    imageUrl: article!.imageUrl,
                  )),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: articles!.length,
    );
  }
}
