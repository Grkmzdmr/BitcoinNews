import 'package:dio/dio.dart';
import 'package:mvvm_news_app/models/news_article.dart';

class WebService{
   var dio = Dio();

   Future<List<NewsArticle>> fetchTopHeadlines() async{
     String url = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=YOURAPIKEY';
     final response = await dio.get(url);
     if(response.statusCode == 200){
       final result = response.data;
       Iterable list = result['articles'];
       return list.map((article) => NewsArticle.fromJson(article)).toList();
     }else{
       throw Exception("failed to fetch");

     }
   }
}