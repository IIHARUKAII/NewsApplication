import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news/helper/news.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/view/article_view.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();

}

class _CategoryNewsState extends State<CategoryNews> {



  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
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
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16)
                ,child: Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
                        author: articles[index].author,
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

  final String imageUrl, title, desc, url, publishedAt, author;
  BlogTile({@required this.imageUrl, @required this.title, @required this.desc, @required this.url, @required this.publishedAt, @required this.author});

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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),

            SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(author?? 'default'),
            ),

            SizedBox(height: 8,),
            Text(title, style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),),
            SizedBox(height: 8,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child:Row(
                children: [Icon(Icons.timer,),
                  Text(publishedAt, style: TextStyle(
                      color: Colors.grey
                  ),),
                ],
              ),
            ),
            SizedBox(height: 8,),


            // function to handle when heart icon is tapped

            ///Icon favorite
            // SizedBox(height: 8,),
            // ListTile(
            //   trailing: Icon(Icons.favorite),
            // ),

            // SizedBox(height: 8,),
            // Text(desc, style: TextStyle(
            //     color: Colors.grey
            // ),)
          ],
        ),
      ),
    );

  }

}



