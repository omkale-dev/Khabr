import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khabr/Model/article.dart';
import 'package:khabr/secret.dart';

Future<List> fetchNews({String search}) async {
  List<Article> newslist = [];
  var url;
  if (search != null) {
    url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$search&sortBy=relevancy&apiKey=$apiKey');
  } else {
    url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey');
  }
  try {
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    if (data['status'] == 'ok') {
      data['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          newslist.add(article);
        }
      });
    } else {
      print("data['status']!=ok");
      print(data['status'] + "\n" + data['message']);
    }
  } catch (e) {
    print("Something went wrong in fetching the data!");
    print(e);
  }
  return newslist;
}
