import 'dart:convert';
// import 'package:flutter/cupertino.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=d4595ea3332a45008da823c2da472966";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              aurthor: element['aurthor'],
              title: element['title'],
              urlToImage: element['urlToImage'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d4595ea3332a45008da823c2da472966";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              aurthor: element['aurthor'],
              title: element['title'],
              urlToImage: element['urlToImage'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}
