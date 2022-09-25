import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_news_app/viewmodels/news_article_list_viewmodel.dart';
import 'package:mvvm_news_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void initState() {
    Provider.of<NewArticlesListViewModel>(context, listen: false)
        .topHeadLines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewArticlesListViewModel>(context);

    return Scaffold(
      
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
             Padding(
              padding:  EdgeInsets.only(left : 30.0,top: 15,bottom: 15),
              child: Column(
                children: [
                  Text('Bitcoin News',style: TextStyle(fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Today - 25.08.2022",style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 199, 161, 20),
              height: 40,
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            
            Expanded(child: NewsGrid(articles: listViewModel.articles,)),
          ],
        ),
      )
    );
  }
}
