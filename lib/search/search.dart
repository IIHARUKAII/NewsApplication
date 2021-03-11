import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/Team/team_page.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news.dart';
import 'package:news/helper/news.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/view/article_view.dart';
import 'package:news/view/home.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getAllNews();
  }

  getAllNews() async{
    AllNews  newsClass = AllNews ();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text("Application", style: TextStyle(
                color: Colors.lightBlue

            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              ///blog
              Container(
                child: ListView.builder(
                    itemCount: articles.length ,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title:  articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                        publishedAt: articles[index].publishedAt,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url, publishedAt;
  BlogTile({@required this.imageUrl, @required this.title, @required this.desc, @required this.url, @required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),),
             SizedBox(height: 8,),
             Text(desc, style: TextStyle(
                color: Colors.grey
            ),),
            SizedBox(height: 8,),
            Text(publishedAt, style: TextStyle(
                color: Colors.grey
            ),),
          ],
        ),
      ),
    );
  }
}

