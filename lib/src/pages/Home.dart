import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("안녕"),
          RaisedButton(
            child: Text('지금 바로 가기'),
            onPressed: () {},
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
