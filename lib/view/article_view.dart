import 'dart:async';

import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleView extends StatefulWidget {

  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbledNavigationBar(
        defaultBubbleColor: Colors.blue,
        onTap: (index) {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    ) ;
  }
}
