import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          color: Colors.red,
        ),
        Container(
          height: 120.0,
          color: Colors.blue,
        ),
        Container(
          height: 120.0,
          color: Colors.black,
        ),
        Row(
          children: <Widget>[
            Expanded(child: Container(
              height: 100.0,
              color: Colors.orange,
            )
            ),
            Expanded(child: Container(
              height: 100.0,
              color: Colors.pink,
            )
            )
          ],
        )
      ],
    );
  }
  }

