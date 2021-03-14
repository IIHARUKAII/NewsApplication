import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6e98598915704fb9aa83abea8f4a3d52";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              publishedAt: element["publishedAt"]
          );

          news.add(articleModel);

        }

      });
    }

  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String q) async {
    String url = "https://newsapi.org/v2/top-headlines?q=$q&apiKey=6e98598915704fb9aa83abea8f4a3d52";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              publishedAt: element["publishedAt"]
          );

          news.add(articleModel);
        }
      });
    }
  }
}


class AllNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String q) async {
    String url = "https://newsapi.org/v2/top-headlines?q=$q&country=us&category=technology&apiKey=6e98598915704fb9aa83abea8f4a3d52";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              publishedAt: element["publishedAt"]
          );

          news.add(articleModel);
        }
      });
    }
  }
}