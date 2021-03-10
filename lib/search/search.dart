import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/Team/team_page.dart';
import 'package:news/view/home.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        margin: EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black38.withAlpha(10),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search News",
                  hintStyle: TextStyle(
                    color: Colors.black.withAlpha(120),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (String keyword) {},
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.black.withAlpha(120),
            )
          ],
        ),
      ),
    );
  }
}
