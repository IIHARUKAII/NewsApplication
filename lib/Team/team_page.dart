import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
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
