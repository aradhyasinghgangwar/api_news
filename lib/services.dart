import 'dart:convert';

import 'package:api_news/articles.dart';
import 'package:http/http.dart';

class Apiservice {
  final String endPointUrl =
      "https://newsapi.or g/v2/everything?q=tesla&from=2022-01-27&sortBy=publishedAt&apiKey=fa7a590c7ff54ca3aff22408e5cbd969";

  Future<List<dynamic>?> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
