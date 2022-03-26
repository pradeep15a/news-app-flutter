import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_app/widgets/NewsTile.dart'; //Yup it has been imported here our new widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  List<Map<String, dynamic>> articles = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=805e3a6c1b404db5a481418ec3cffbbb';
    var response = await http.get(Uri.parse(
        url)); 
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['content'] != null) {
          articles.add(element);
        }
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GDSC UVCE News App")),
      body: ListView(
        //DO it //See we r displaying our articles as single column that's why it shows error lets make it as ListView ...It'll get cleared Okay
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Latest News from All Over the World!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          //Here after the comma start typing
          ListView.builder(
            //First Item count to say how may things we want to display lets have 5 as of now
            itemCount: articles.length, //Do it
            shrinkWrap:
                true, //shrink wrap says what list u r building it stays in the center of the screen doesn't overflow
            physics:
                ScrollPhysics(), //This scroll physics gives the effect after scrolling which denotes the end
            //Now the itemBuilder within this itemBuilder we r using a method called Buildcontext with an index Build context is the method we use to return something on the screen see in the top also we have used Bildcontext
            //But here with the index value...This index value is obtained from the itemCount we r saying above we doesn't need to declare anything for bringing index builder automatically considers the itemCount as index got it ?
            itemBuilder: (BuildContext context, int index) {
              //now we should return something to the screen
              return Container(
                //This container will have our NewsTile...Do until here done?? any issues? lets set a padding for out container
                padding: EdgeInsets.all(
                    8.0), //EdgeInsets means padding from the edges for all sides we have set to 8
                child: NewsTile(
                  //The child of the container is our NewsTile done?
                  articleUrl: articles[index][
                      'url'], //This statement says from the articles variable we have many number of article urls so to fetch it one by one we use the index property say 'article[0]['url']' which means the first url in the json data and the string 'url' we get it from the api let me show it to u okay? so lets use it here
                  title: articles[index]
                      ['title'], //This is title again fetching as array
                  description: articles[index]
                      ['description'], //Description donee next is image url
                  imgUrl: articles[index]['urlToImage'] != null
                      ? articles[index]['urlToImage'] //Do it after say Done!
                      : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg", //Here lets do//Next is content parameter
                  content: articles[index]
                      ['content'], // but wait let's run and see it  our luck
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
//Fine yesterday we created a new widget and displayed it on the screen ryt ? what do we want to do if we want more and more articles ...we cant be typing all the things one by one
//SO that we use ListView.builder widget. It is a widget which builds a list view with some required properties i.e itemCount which says how many items to render and the other one is itemBuilder which builds the list for us ok ?
// Now lets remove the NewsTile and enter ListView.builder widget ...Do it and make sure no errors appear  Done?
// Now lets implement listview builder


//Lets create a new screen in the screens folder called 'ArticleDetails.dart' 