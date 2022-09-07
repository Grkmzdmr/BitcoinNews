import 'package:mvvm_news_app/models/news_article.dart';

class NewsArticleViewModel{
  final NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle? article}) : _newsArticle = article!;

  String get title{
    return _newsArticle.title!;
  }
  String get description{
    return _newsArticle.description!;

  }
  String get imageUrl{
    return _newsArticle.urlToImage!;
  }
  String get url{
    return _newsArticle.url!;
  }
  String get author{
    return _newsArticle.author!;
  }
}