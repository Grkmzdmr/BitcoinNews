import 'package:flutter/material.dart';
import 'package:mvvm_news_app/models/news_article.dart';
import 'package:mvvm_news_app/services/web_service.dart';
import 'package:mvvm_news_app/viewmodels/news_article_viewmodel.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}

class NewArticlesListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];


  void topHeadLines() async{
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    if(articles.isEmpty){
      loadingStatus = LoadingStatus.empty;

    }else{
      loadingStatus = LoadingStatus.completed;
    }
  }
}