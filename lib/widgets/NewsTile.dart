//THIS is NewsTile.dart
//Now u do
import 'package:flutter/material.dart';
import 'package:new_app/screens/ArticleDetails.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl;
  final String articleUrl;
  final String content;
  NewsTile(
      {required this.title,
      required this.description,
      required this.imgUrl, //See this so called as constructor  the same we wanna create pn our details screen
      required this.articleUrl,
      required this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            description,
            maxLines: 2,
          ),
          leading: ClipRect(
              child: Image.network(
            imgUrl,
            width: 50,
            height: 100,
            fit: BoxFit.cover,
          )),
          //Lets add some code here to onTap okay first remove the print statement done??k fine
          onTap: () {
            //Add Navigator.push here
            Navigator.push(context,
                MaterialPageRoute(
                  //Do until here ok now call the builder to build the context 
                  builder: (context) => ArticleDetail(title: this.title, //Now add this before all the parameters because we want the parameters which we get to specific tile Ok? 
                  description: this.description, 
                  imgUrl: this.imgUrl, 
                  articleUrl: this.articleUrl, 
                  content: this.content),    //Separated it to look good Do until here done?? //Now enter our screen name and pass the parameters
                  //That's it!!!! Finished with ur first flutter application project Lets Run it!!!! 
                ),  //We r using Material page route for routing to out details screen
                ); //Here it says the context is to be pushed and the route means from where we want to provite route got it ?
          },
        ),
      ),
    );
  }
}

// Goto details screen 