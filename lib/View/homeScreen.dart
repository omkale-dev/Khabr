import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khabr/Controller/newsController.dart';
import 'package:khabr/Data/categories.dart';
import 'package:khabr/Model/article.dart';
import 'package:khabr/View/categoryCard.dart';
import 'package:khabr/View/drawerView.dart';
import 'package:khabr/View/newsListCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> news = [];
  var category;
  bool loading = true;
  getNews({String searchNews}) async {
    if (searchNews != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Fetching News on $searchNews",
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
      ));
      news = await fetchNews(search: searchNews);

      loading = false;
    } else {
      news = await fetchNews();
      loading = false;
    }
    setState(() {
      news = news;
    });
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            getNews();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Refreshed",
                  textAlign: TextAlign.center,
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
        drawer: Drawer(
          child: DrawerView(),
        ),
        appBar: AppBar(
          title: Text("khaBr"),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                onSubmitted: (value) {
                  getNews(searchNews: value);
                  textEditingController.clear();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 2)),
                  hintText: "Search News",
                ),
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (c, i) {
                  return CategoryCard(
                    imageAssetUrl: categoryList[i].imageUrl,
                    category: categoryList[i].category,
                    getCategoryNews: () =>
                        getNews(searchNews: categoryList[i].category),
                  );
                },
                itemCount: categoryList.length,
              ),
            ),
            loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemBuilder: (c, i) {
                      return NewsListCard(
                        imageUrl: news[i].urlToImage,
                        title: news[i].title,
                        description: news[i].description,
                        articleUrl: news[i].articleUrl,
                      );
                    },
                    itemCount: news.length,
                  ),
            Container(
              height: 200,
              child: Center(
                child: Text(
                  "You are upto date!\n Please refresh for more",
                  style: TextStyle(fontSize: 25, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }
}
