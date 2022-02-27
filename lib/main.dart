import 'package:api_news/customtile.dart';
import 'package:api_news/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'articles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Apiservice client = Apiservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white70,
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customTileList(articles[index], context));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
