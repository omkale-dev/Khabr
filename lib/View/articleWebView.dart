import 'dart:io';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String articleUrl;
  ArticleWebView({@required this.articleUrl});
  @override
  _ArticleWebViewState createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
    loading = true;
  }

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("khaBr"),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              String share =
                  "Hey, checkout this article\n${widget.articleUrl}\n\nDownload the khaBr app for more.";
              Share.share(share, subject: "khaBr Share");
            },
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Stack(children: [
        WebView(
          onPageFinished: (finish) {
            setState(() {
              loading = false;
            });
          },
          initialUrl: widget.articleUrl,
        ),
        loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack()
      ]),
    );
  }
}
