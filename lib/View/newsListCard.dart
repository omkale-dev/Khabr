import 'package:flutter/material.dart';
import 'package:khabr/View/articleWebView.dart';

class NewsListCard extends StatelessWidget {
  final String imageUrl, title, description, articleUrl;
  NewsListCard(
      {@required this.imageUrl, this.title, this.description, this.articleUrl});

  ImageProvider getImage() {
    try {
      return NetworkImage(imageUrl);
    } catch (e) {
      print("Error in loading image");
      return AssetImage('assets/images/khaBr.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => ArticleWebView(articleUrl: articleUrl))),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFF220220220)),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  // image: NetworkImage(imageUrl),
                  image: getImage(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
