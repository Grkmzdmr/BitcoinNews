import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_news_app/viewmodels/news_article_viewmodel.dart';
import 'package:mvvm_news_app/widgets/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel? article;
  const NewsArticleDetailScreen({Key? key,this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News Details")
      ),
      body: Container(
              child: Column(
                children: [
                 
                  Expanded(flex:4,child: Padding(
                    padding: const EdgeInsets.only(left:24.0,top: 24.0,right: 24.0),
                    child: Text(article?.title ?? 'Undefined',style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                  )),
                  
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20.0),
                      child: Container(height: 200,child: CircleImage(imageUrl: article?.imageUrl),),
                    ),
                  ),
                  Expanded(child: Padding(padding: const EdgeInsets.all(8),
                  child: Text("12.07.2022 10:52",),)),
                  Expanded(flex: 4,child: Padding(padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 24),
                  child: Text(article?.description ?? 'Undefined',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18)) 
                  
                  ,)),
                  Spacer(flex: 2,)
                  
                ],
              ),
            ),
    );
  }
}
