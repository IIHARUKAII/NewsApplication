import 'dart:io';

import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Team/team_page.dart';
import 'package:news/favorite/favorite.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/search/search.dart';
import 'package:news/view/article_view.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List pages = [Home(), SearchPage(), FavoritePage(), TeamPage()];

  int currentIndex = 0;//เควบคุมเลขหน้า 1 ข้อมูลส่วนตัว


  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            DrawerHeader(child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Image.network("https://help.apple.com/assets/55DCB4D2680CE2712805104D/5CF6C4FB094622F95B64260A/en_US/4690175da1875eae72bf1b0d92dd85d1.png"),
            )),
            SizedBox(height: 40),
            ListTile(
              title: Text('หน้าหลัก',style: TextStyle(fontSize: 20.0),),
              subtitle: Text('การเข้าหน้าแรก'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Home()));
              },
            ),
            ListTile(
              title: Text('Search',style: TextStyle(fontSize: 20.0),),
              subtitle: Text('หาข่าวที่ต้องการ'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SearchPage()));
              },
            ),
            ListTile(
              title: Text('Favorite',style: TextStyle(fontSize: 20.0),),
              subtitle: Text('ข่าวที่เคยถูกใจ'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Team',style: TextStyle(fontSize: 20.0),),
              subtitle: Text('สมาชิก'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TeamPage()));
              },
            ),
            ListTile(
              title: Text('หน้าออกจากโปรแกรม',style: TextStyle(fontSize: 20.0),),
              subtitle: Text('ออกจากการใช้งาน'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),



          bottomNavigationBar: BubbledNavigationBar(
            defaultBubbleColor: Colors.blue,
            onTap: (int index) {
              // handle tap
            },
            items: <BubbledNavigationBarItem>[
              BubbledNavigationBarItem(
                icon:       Icon(CupertinoIcons.home, size: 30, color: Colors.red),
                activeIcon: Icon(CupertinoIcons.home, size: 30, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              BubbledNavigationBarItem(
                icon:       Icon(CupertinoIcons.search, size: 30, color: Colors.purple),
                activeIcon: Icon(CupertinoIcons.search, size: 30, color: Colors.white),
                title: Text('Phone', style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              BubbledNavigationBarItem(
                icon:       Icon(CupertinoIcons.square_favorites, size: 30, color: Colors.teal),
                activeIcon: Icon(CupertinoIcons.square_favorites, size: 30, color: Colors.white),
                title: Text('Info', style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
              BubbledNavigationBarItem(
                icon:       Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.cyan),
                activeIcon: Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.white),
                title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
            ],
          ),
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

              ///category
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
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
                        //desc: articles[index].description,
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

class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toString().toLowerCase(),
            )
        ));
      },
      child: Container(
        margin:  EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,)
            ),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categoryName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
            )
          ],
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
            Text(publishedAt, style: TextStyle(
                color: Colors.grey
            ),),
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

