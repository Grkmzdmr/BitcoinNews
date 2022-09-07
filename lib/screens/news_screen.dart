import 'package:flutter/material.dart';
import 'package:mvvm_news_app/viewmodels/news_article_list_viewmodel.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {


  @override
  void initState() {
    Provider.of<NewArticlesListViewModel>(context,listen: false).topHeadLines();
      super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewArticlesListViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Text(listViewModel.articles.length.toString()),
    );
  }
}
