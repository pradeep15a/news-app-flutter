import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl;
  final String articleUrl;
  final String content;
  ArticleDetail(
      {required this.title,
      required this.description,
      required this.imgUrl,
      required this.articleUrl,
      required this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A Detailed Look")),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(
              this.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRect(
                child: Image.network(
              this.imgUrl,
              fit: BoxFit.cover,
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              this.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.content,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!await launch(articleUrl)) throw 'Could not launch';
              },
              child: Text("Read full article"),
            ),
          ],
        ),
      ),
    );
  }
}
