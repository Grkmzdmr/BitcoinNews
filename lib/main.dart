import 'package:flutter/material.dart';
import 'package:mvvm_news_app/screens/news_screen.dart';
import 'package:mvvm_news_app/viewmodels/news_article_list_viewmodel.dart';
import 'package:mvvm_news_app/viewmodels/news_article_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitcoinNews',
      theme: ThemeData(),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => NewArticlesListViewModel()),

      ],
      child: News(),
      ),
    );
  }
}
