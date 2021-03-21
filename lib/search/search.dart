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
import 'package:news/view/category_news.dart';
import 'package:news/view/home.dart';

class myclass {
  String word;


  myclass(this.word);
}


class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.q}) : super(key: key);
  final String q;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();
  List<myclass> q = [
    myclass("apple"),
    myclass("microsoft"),
    myclass("tesla"),
    myclass("technology"),
    myclass("cloud"),
    myclass("5g"),
    myclass("robot"),
    myclass("ai"),
    myclass("google"),
    myclass("smart"),
    myclass("game"),
    myclass("samsung"),
    myclass("ps5"),
    myclass("airpod"),
  ];



  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    // getCategoryNews();
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

      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: q.length,
                  itemBuilder: (context, index) {
                    if (editingController.text.isEmpty) {
                      return ListTile(
                        title:
                        Text('${q[index].word} '),
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => CategoryNews(
                          //       category: q.toString().toLowerCase(),
                          //     )
                          // ));
                        },
                      );
                    } else if (q[index]
                        .word
                        .toLowerCase()
                        .contains(editingController.text) ||
                        q[index]
                            .word
                            .toLowerCase()
                            .contains(editingController.text)) {
                      return ListTile(
                        title:
                        Text('${q[index].word} '),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CategoryNews(
                                category: q[index].word.toString().toLowerCase(),
                              )
                          ));
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}



