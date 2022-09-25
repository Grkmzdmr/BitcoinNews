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
      debugShowCheckedModeBanner: false,
      title: 'BitcoinNews',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 199, 161, 20),
          elevation: 0,
       
          actionsIconTheme: IconThemeData(color: Colors.black)
        ),
       
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => NewArticlesListViewModel()),

      ],
      child: News(),
      ),
    );
  }
}
